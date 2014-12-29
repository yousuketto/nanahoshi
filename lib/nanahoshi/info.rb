module Nanahoshi::Info
  class << self
    def nodes_and_edges
      graph = load_graph
      gem_names = graph.keys

      nodes = gem_names.map{|gn|{name: gn, type: %i(start_leaf end_leaf)}}

      edges = []
      graph.each do |gem_name, deps|
        source_index = gem_names.index(gem_name)
        unless deps.empty?
          nodes[source_index][:type].delete(:end_leaf)
        end
        dependence_edges = deps.map do |dep|
          target_index = gem_names.index(dep)
          nodes[target_index][:type].delete(:start_leaf)
          {source: source_index, target: target_index}
        end
        edges.concat(dependence_edges)
      end
      [nodes, edges]
    end

    private
    def load_graph
      lookup = Bundler.load.specs.to_hash
      lookup.each_with_object({}) do |(gemname, specs), hash|
        hash[gemname] = specs.map do |spec|
          spec.dependencies.select{|dependency|dependency.type == :runtime}.map(&:name)
        end.flatten.uniq
      end
    end
  end

end
