# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rack-request-id/version'

Gem::Specification.new do |gem|
  gem.name          = "rack-request-id"
  gem.version       = Rack::RequestId::VERSION
  gem.authors       = ["Brian Racer"]
  gem.email         = ["bracer@gmail.com"]
  gem.description   = %q{Request ID Header}
  gem.summary       = %q{Adds a request id header if none exists.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
