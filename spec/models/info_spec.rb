require 'spec_helper'
require 'nanahoshi/info'
describe Nanahoshi::Info do
  before do
    graph = {
      "libv8"=>[], "minitest"=>[], "turbolinks"=>["coffee-rails"], "tilt"=>[], "thread_safe"=>[], "thor"=>[],
      "therubyracer"=>["ref", "libv8"], "sprockets-rails"=>["sprockets", "actionpack", "activesupport"],
      "sprockets"=>["hike", "multi_json", "rack", "tilt"], "spring"=>[], "sdoc"=>["rdoc", "json"],
      "sass-rails"=>["sass", "railties", "sprockets-rails", "sprockets"], "sass"=>[], "ref"=>[], "rdoc"=>["json"],
      "rake"=>[], "railties"=>["activesupport", "actionpack", "rake", "thor"],
      "rails"=>["activesupport", "actionpack", "actionview", "activemodel", "activerecord", "actionmailer", "railties", "bundler", "sprockets-rails"],
      "rack-test"=>["rack"], "rack"=>[], "nanahoshi"=>["rails"], "multi_json"=>[], "tzinfo"=>["thread_safe"],
      "mime-types"=>[], "mail"=>["mime-types"], "uglifier"=>["execjs", "json"], "json"=>[],
      "jquery-rails"=>["railties", "thor"], "jbuilder"=>["activesupport", "multi_json"], "i18n"=>[], "hike"=>[],
      "execjs"=>[], "erubis"=>[], "coffee-script-source"=>[], "coffee-script"=>["coffee-script-source", "execjs"],
      "coffee-rails"=>["coffee-script", "railties"], "bundler"=>[], "builder"=>[], "arel"=>[],
      "activesupport"=>["i18n", "json", "tzinfo", "minitest", "thread_safe"],
      "activerecord"=>["activesupport", "activemodel", "arel"], "activemodel"=>["activesupport", "builder"],
      "actionview"=>["activesupport", "builder", "erubis"],
      "actionpack"=>["activesupport", "rack", "rack-test", "actionview"],
      "actionmailer"=>["actionpack", "actionview", "mail"]
    }
    allow(Nanahoshi::Info).to receive(:load_graph).and_return(graph)
  end
  it "load nodes array and edges array" do
    expected_nodes = [
      {:name=>"libv8", :type=>[:end_leaf]}, {:name=>"minitest", :type=>[:end_leaf]},
      {:name=>"turbolinks", :type=>[:start_leaf]}, {:name=>"tilt", :type=>[:end_leaf]},
      {:name=>"thread_safe", :type=>[:end_leaf]}, {:name=>"thor", :type=>[:end_leaf]},
      {:name=>"therubyracer", :type=>[:start_leaf]}, {:name=>"sprockets-rails", :type=>[]},
      {:name=>"sprockets", :type=>[]}, {:name=>"spring", :type=>[:start_leaf, :end_leaf]},
      {:name=>"sdoc", :type=>[:start_leaf]}, {:name=>"sass-rails", :type=>[:start_leaf]},
      {:name=>"sass", :type=>[:end_leaf]}, {:name=>"ref", :type=>[:end_leaf]}, {:name=>"rdoc", :type=>[]},
      {:name=>"rake", :type=>[:end_leaf]}, {:name=>"railties", :type=>[]}, {:name=>"rails", :type=>[]},
      {:name=>"rack-test", :type=>[]}, {:name=>"rack", :type=>[:end_leaf]},
      {:name=>"nanahoshi", :type=>[:start_leaf]}, {:name=>"multi_json", :type=>[:end_leaf]},
      {:name=>"tzinfo", :type=>[]}, {:name=>"mime-types", :type=>[:end_leaf]}, {:name=>"mail", :type=>[]},
      {:name=>"uglifier", :type=>[:start_leaf]}, {:name=>"json", :type=>[:end_leaf]},
      {:name=>"jquery-rails", :type=>[:start_leaf]}, {:name=>"jbuilder", :type=>[:start_leaf]},
      {:name=>"i18n", :type=>[:end_leaf]}, {:name=>"hike", :type=>[:end_leaf]}, {:name=>"execjs", :type=>[:end_leaf]},
      {:name=>"erubis", :type=>[:end_leaf]}, {:name=>"coffee-script-source", :type=>[:end_leaf]},
      {:name=>"coffee-script", :type=>[]}, {:name=>"coffee-rails", :type=>[]}, {:name=>"bundler", :type=>[:end_leaf]},
      {:name=>"builder", :type=>[:end_leaf]}, {:name=>"arel", :type=>[:end_leaf]}, {:name=>"activesupport", :type=>[]},
      {:name=>"activerecord", :type=>[]}, {:name=>"activemodel", :type=>[]}, {:name=>"actionview", :type=>[]},
      {:name=>"actionpack", :type=>[]}, {:name=>"actionmailer", :type=>[]}
    ]
    expected_edges = [
      {:source=>2, :target=>35}, {:source=>6, :target=>13}, {:source=>6, :target=>0}, {:source=>7, :target=>8},
      {:source=>7, :target=>43}, {:source=>7, :target=>39}, {:source=>8, :target=>30}, {:source=>8, :target=>21},
      {:source=>8, :target=>19}, {:source=>8, :target=>3}, {:source=>10, :target=>14}, {:source=>10, :target=>26},
      {:source=>11, :target=>12}, {:source=>11, :target=>16}, {:source=>11, :target=>7}, {:source=>11, :target=>8},
      {:source=>14, :target=>26}, {:source=>16, :target=>39}, {:source=>16, :target=>43}, {:source=>16, :target=>15},
      {:source=>16, :target=>5}, {:source=>17, :target=>39}, {:source=>17, :target=>43}, {:source=>17, :target=>42},
      {:source=>17, :target=>41}, {:source=>17, :target=>40}, {:source=>17, :target=>44}, {:source=>17, :target=>16},
      {:source=>17, :target=>36}, {:source=>17, :target=>7}, {:source=>18, :target=>19}, {:source=>20, :target=>17},
      {:source=>22, :target=>4}, {:source=>24, :target=>23}, {:source=>25, :target=>31}, {:source=>25, :target=>26},
      {:source=>27, :target=>16}, {:source=>27, :target=>5}, {:source=>28, :target=>39}, {:source=>28, :target=>21},
      {:source=>34, :target=>33}, {:source=>34, :target=>31}, {:source=>35, :target=>34}, {:source=>35, :target=>16},
      {:source=>39, :target=>29}, {:source=>39, :target=>26}, {:source=>39, :target=>22}, {:source=>39, :target=>1},
      {:source=>39, :target=>4}, {:source=>40, :target=>39}, {:source=>40, :target=>41}, {:source=>40, :target=>38},
      {:source=>41, :target=>39}, {:source=>41, :target=>37}, {:source=>42, :target=>39}, {:source=>42, :target=>37},
      {:source=>42, :target=>32}, {:source=>43, :target=>39}, {:source=>43, :target=>19}, {:source=>43, :target=>18},
      {:source=>43, :target=>42}, {:source=>44, :target=>43}, {:source=>44, :target=>42}, {:source=>44, :target=>24}
    ]
    nodes, edges = Nanahoshi::Info.nodes_and_edges

    expect(nodes).to eq expected_nodes
    expect(edges).to eq expected_edges
  end
end
