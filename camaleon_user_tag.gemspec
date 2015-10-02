$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "camaleon_user_tag/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name = "camaleon_user_tag"
  s.version = CamaleonUserTag::VERSION
  s.authors = ["Raúl Anatol"]
  s.email = ["raul@natol.es"]
  s.homepage = 'http://'
  s.summary = ": Summary of CamaleonUserTag."
  s.description = ": Description of CamaleonUserTag."
  s.license = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency 'rails', '~> 4.2'

  s.add_development_dependency 'sqlite3', '~> 1.3'
end
