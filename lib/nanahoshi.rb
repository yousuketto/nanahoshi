require "json"
require "nanahoshi/version"
if defined? Rails
  require "nanahoshi/engine"
end
module Nanahoshi
  autoload :Info, 'nanahoshi/info'
end
