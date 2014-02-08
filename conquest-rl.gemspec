# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'conquest/version'

Gem::Specification.new do |spec|
  spec.name          = "conquest-rl"
  spec.version       = Conquest::VERSION
  spec.authors       = ["BennyHallett"]
  spec.description   = %q{A roguelike inspired by Mount and Blade, Dwarf Fortress and DCSS}
  spec.summary       = %q{Conquest Roguelike}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'mocha'
  spec.add_runtime_dependency     "delve", "~> 0.0.3"
end
