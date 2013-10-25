# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nodestack/version'

Gem::Specification.new do |spec|
  spec.name          = "nodestack"
  spec.version       = Nodestack::VERSION
  spec.authors       = ["Keyvan Fatehi"]
  spec.email         = ["keyvanfatehi@gmail.com"]
  spec.description   = %q{Helps with manipulating a NodeJS stack from Ruby}
  spec.summary       = %q{Helps with manipulating a NodeJS stack from Ruby}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "simplecov"

  spec.add_runtime_dependency "mongo"
  spec.add_runtime_dependency "bson_ext"
end
