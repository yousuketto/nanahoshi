$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "nanahoshi/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "nanahoshi"
  s.version     = Nanahoshi::VERSION
  s.authors     = ["yousuketto"]
  s.email       = ["yosuketto@gmail.com"]
  s.homepage    = "https://github.com/yousuketto/nanahoshi"
  s.summary     = "Nanahoshi is web ui for gem dependencies graph."
  s.description = "Nanahoshi is web ui for gem dependencies graph."
  s.license     = "MIT"

  s.files = Dir["{app,config,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", ">= 3.0.0"
  s.add_development_dependency "rspec-rails"
end
