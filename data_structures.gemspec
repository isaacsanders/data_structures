# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'data_structures/version'

Gem::Specification.new do |gem|
  gem.name          = "data_structures"
  gem.version       = DataStructures::VERSION
  gem.authors       = ["Isaac Sanders"]
  gem.email         = ["isaac@isaacbfsanders.com"]
  gem.description   = %q{Data Structures that I decided to implement.}
  gem.summary       = %q{Data Structures that I decided to implement.}
  gem.homepage      = "http://isaacbfsanders.com/data_structures"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
