$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "nanahoshi/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "nanahoshi"
  s.version     = Nanahoshi::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Nanahoshi."
  s.description = "TODO: Description of Nanahoshi."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.1.6"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "sqlite3"
end
