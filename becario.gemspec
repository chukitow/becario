# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'becario/version'

Gem::Specification.new do |spec|
  spec.name          = "becario"
  spec.version       = Becario::VERSION
  spec.authors       = ["Ivan Velasquez"]
  spec.email         = ["ivan.velasquez.rios@gmail.com"]
  spec.summary       = %q{Log readmine hours from a csv file}
  spec.description   = %q{Selenium script to log your readmine hours from a csv file}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency 'selenium-webdriver', '~> 2.53'
end
