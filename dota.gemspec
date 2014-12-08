# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dota/version'

Gem::Specification.new do |gem|
  gem.name          = "dota"
  gem.version       = Dota::VERSION
  gem.authors       = ["Vasiliy Ermolovich"]
  gem.email         = ["younash@gmail.com"]
  gem.description   = %q{Ruby wrapper for Dota 2 WebAPI}
  gem.summary       = %q{Ruby wrapper for Dota 2 WebAPI}
  gem.homepage      = "https://github.com/nashby/dota"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'faraday'
  gem.add_dependency 'faraday_middleware'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'minitest'
  gem.add_development_dependency 'webmock'
end
