require "mixtape/version"
require "mixtape/youtube_search"
require "mixtape/pitchfork"
require "mixtape/playlist_url"
require "mixtape/cli"

module Mixtape
  Song = Struct.new(:artist, :title)
end
