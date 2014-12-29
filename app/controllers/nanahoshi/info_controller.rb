class Nanahoshi::InfoController < ApplicationController
  def index
    @nodes, @edges = Nanahoshi::Info.nodes_and_edges
  end
end
