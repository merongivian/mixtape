module Mixtape
  module PlaylistURL
    class InvalidSource < StandardError; end

    def self.best_new_tracks(source)
      begin
        contantized_source = Mixtape::Source.const_get(source.capitalize)
      rescue NameError
        raise InvalidSource
      end
      songs = contantized_source.best_new_tracks
      ids = songs.map do |song|
        Youtube.video_id("#{song.artist} #{song.title}")
      end
      Youtube.playlist_url ids
    end
  end
end
