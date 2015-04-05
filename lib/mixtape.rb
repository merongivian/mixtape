require "mixtape/version"
require "mixtape/cli"
require "mixtape/youtube_playlist"
require "mixtape/random_songs"
require "mixtape/music_blog_info"
require "mixtape/source/pitchfork"
require "mixtape/source/nme"

module Mixtape
  Song = Struct.new(:artist, :title)
end
