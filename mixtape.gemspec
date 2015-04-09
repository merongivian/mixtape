# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mixtape/version'

Gem::Specification.new do |spec|
  spec.name          = "mixtape"
  spec.version       = Mixtape::VERSION
  spec.authors       = ["Jose Añasco"]
  spec.email         = ["joseanasco1@gmail.com"]
  spec.description   = %q{Curated music playlists directly to your browser}
  spec.summary       = "Create music youtube playlists from the command line, "\
                       "choose your favorite music blog and enjoy!!"
  spec.homepage      = "https://github.com/merongivian/mixtape"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.files         = Dir['README.md', 'lib/**/*', 'bin/*']
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "metainspector", "~> 4.4.1"
  spec.add_dependency "nokogiri", "~> 1.6.6.2"
  spec.add_dependency "launchy", "~> 2.4.3"
  spec.add_dependency "pmap", "~> 1.0.2"
  spec.add_dependency "lolcat", "~> 42.1.0"
  spec.add_development_dependency "minitest-vcr", "~> 1.2.2"
  spec.add_development_dependency "webmock", "~> 1.20.4"
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.5.1"
  spec.add_development_dependency "mocha", "~> 1.1.0"
  spec.add_development_dependency "minitest-reporters", "~> 1.0.11"
  spec.add_development_dependency "shoulda", "~> 3.5.0"
end
