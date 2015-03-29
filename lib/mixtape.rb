require "mixtape/version"
require "mixtape/youtube_search"
require "mixtape/pitchfork"
require "mixtape/cli"

module Mixtape
  def self.pitchfork_playlist
    songs_info = Pitchfork.best_new_tracks
    songs_info.map do |song_info|
      Youtube.video_id("#{song_info[:artist]} #{song_info[:song]}")
    end
  end
end
