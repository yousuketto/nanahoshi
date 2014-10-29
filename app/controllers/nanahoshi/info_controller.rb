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
    @nodes = gem_names.map{|gem_name|{name: gem_name}}

    @edges = []
    hash.each do |gem, deps|
      source_index = gem_names.index(gem)
      dependence_edges = deps.map do |dep|
        {source: source_index, target: gem_names.index(dep)}
      end

      @edges.concat(dependence_edges)
    end
  end
end
