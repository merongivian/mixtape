require 'mixtape'
require 'minitest/reporters'
require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/mini_test'
require "vcr"
require "minitest-vcr"
require "webmock/minitest"
require 'shoulda/context'

VCR.configure do |c|
  c.cassette_library_dir = 'test/cassettes'
  c.hook_into :webmock
  c.allow_http_connections_when_no_cassette = true
  c.default_cassette_options = {record: :once}
end

MinitestVcr::Spec.configure!

reporter_options = { color: true }
Minitest::Reporters.use! [Minitest::Reporters::SpecReporter.new(reporter_options)]
