# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails_error_logger/version'

Gem::Specification.new do |spec|
  spec.name          = "rails_error_logger"
  spec.version       = RailsErrorLogger::VERSION
  spec.authors       = ["koshigoe"]
  spec.email         = ["koshigoeb@gmail.com"]

  spec.summary       = %q{Add logger for error monitoring.}
  spec.description   = %q{Add logger for error monitoring.}
  spec.homepage      = "https://github.com/koshigoe/rails_error_logger"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_runtime_dependency "railties"
  spec.add_runtime_dependency "activesupport"
  spec.add_runtime_dependency "bugsnag"
end
