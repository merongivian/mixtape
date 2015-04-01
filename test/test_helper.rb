require 'mixtape'
require 'minitest/reporters'
require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/mini_test'
require "vcr"
require "minitest-vcr"
require "webmock/minitest"

VCR.configure do |c|
  c.cassette_library_dir = 'test/cassettes'
  c.hook_into :webmock
  c.allow_http_connections_when_no_cassette = true
end

MinitestVcr::Spec.configure!

reporter_options = { color: true }
Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(reporter_options)]
