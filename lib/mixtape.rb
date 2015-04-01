require "mixtape/version"
require "mixtape/cli"
require "mixtape/playlist_url"
require "mixtape/youtube_search"
require "mixtape/source/pitchfork"
require "mixtape/source/nme"

module Mixtape
  Song = Struct.new(:artist, :title)
end
