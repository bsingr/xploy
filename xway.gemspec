# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'xway/version'

Gem::Specification.new do |gem|
  gem.name          = "xway"
  gem.version       = Xway::VERSION
  gem.authors       = ["Jens Bissinger"]
  gem.email         = ["mail@jens-bissinger.de"]
  gem.description   = %q{appway client}
  gem.summary       = %q{see github.com/threez/appway}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'httparty'

  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'rspec-nc'
  gem.add_development_dependency 'guard'
  gem.add_development_dependency 'guard-rspec'
  gem.add_development_dependency 'terminal-notifier-guard'
end
