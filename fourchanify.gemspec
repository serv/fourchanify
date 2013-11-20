# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fourchanify/version'

Gem::Specification.new do |spec|
  spec.name          = "fourchanify"
  spec.version       = Fourchanify::VERSION
  spec.authors       = ["Jason Kim"]
  spec.email         = ["active_red@hotmail.com"]
  spec.description   = %q{Download images from 4chan to your computer given a thread url}
  spec.summary       = %q{Download images from 4chan to your computer}
  spec.homepage      = "https://github.com/serv/fourchanify"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.executables   = ["fourchanify"]

  spec.add_dependency "fourchan-urler"
  spec.add_dependency "json"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "factory_girl"
end
