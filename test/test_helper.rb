require 'mixtape'
require 'minitest/reporters'
require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/mini_test'
require 'haml'

reporter_options = { color: true }
Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(reporter_options)]
