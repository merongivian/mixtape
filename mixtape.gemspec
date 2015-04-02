# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mixtape/version'

Gem::Specification.new do |spec|
  spec.name          = "mixtape"
  spec.version       = Mixtape::VERSION
  spec.authors       = ["Jose Añasco"]
  spec.email         = ["joseanasco1@gmail.com"]
  spec.summary       = %q{curated music playlists directly to your browser}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "metainspector", "~> 4.4.1"
  spec.add_dependency "nokogiri", "~> 1.6.6.2"
  spec.add_dependency "launchy", "~> 2.4.3"
  spec.add_development_dependency "minitest-vcr", "~> 1.2.2"
  spec.add_development_dependency "webmock", "~> 1.20.4"
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.5.1"
  spec.add_development_dependency "mocha", "~> 1.1.0"
  spec.add_development_dependency "minitest-reporters", "~> 1.0.11"
  spec.add_development_dependency "shoulda", "~> 3.5.0"
end
