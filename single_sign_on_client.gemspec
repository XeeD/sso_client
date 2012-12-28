# encoding: UTF-8

$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "single_sign_on_client/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "single_sign_on_client"
  s.version     = SingleSignOnClient::VERSION
  s.authors     = ["Lukas Voda"]
  s.email       = ["xeedus@gmail.com"]
  s.homepage    = "http://www.github.com/xeed/"
  s.summary     = "Simple Rails Engine that provides single sign on capabilities to Rails applications."
  s.description = "It is supposed to connect to an application that uses SingleSignOnServer Rails Engine."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.8"
  s.add_dependency "omniauth"
  s.add_dependency "omniauth-oauth2"
  s.add_dependency "haml"

  s.add_development_dependency "sqlite3"
end
