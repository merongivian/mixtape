module Mixtape
  module PlaylistURL
    def self.pitchfork
      songs = Pitchfork.best_new_tracks
      ids = songs.map do |song|
        Youtube.video_id("#{song.artist} #{song.title}")
      end
      Youtube.playlist_url ids
    end
  end
end
