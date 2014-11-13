require 'bundler'
class Nanahoshi::InfoController < ApplicationController
  def index
    lookup = Bundler.load.specs.to_hash
    hash = lookup.each_with_object({}) do |(gemname, specs), hash|
      hash[gemname] = specs.map do |spec|
        spec.dependencies.select{|dependency|dependency.type == :runtime}.map(&:name)
      end.flatten.uniq
    end

    gem_names = hash.keys
    @nodes = gem_names.map{|gem_name|{name: gem_name, type: [:start_leaf, :end_leaf]}}

    @edges = []
    hash.each do |gem_name, deps|
      source_index = gem_names.index(gem_name)
      unless deps.empty?
        @nodes[source_index][:type].delete(:end_leaf)
      end
      dependence_edges = deps.map do |dep|
        target_index = gem_names.index(dep)
        @nodes[target_index][:type].delete(:start_leaf)
        {source: source_index, target: target_index}
      end

      @edges.concat(dependence_edges)
    end
  end
end
