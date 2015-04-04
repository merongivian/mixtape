require 'metainspector'

module Mixtape
  class YoutubePlaylist
    class InvalidSource < StandardError; end
    URL = "http://youtube.com"

    def initialize(source)
      self.source = source
    end

    def url
      songs = @source.best_new_tracks
      ids = songs.map do |song|
        video_id("#{song.artist} #{song.title}")
      end
      playlist_url ids
    end

    private

    def source=(source)
      @source = Mixtape::Source.const_get(source.capitalize)
      rescue NameError; raise InvalidSource
    end

    def video_id(search)
      search_query = search.gsub(/\s+/, "+")
      search_url = URL + "/results?search_query=" + search_query
      youtube_metainspector = MetaInspector.new(search_url)
      links = youtube_metainspector.links.raw
      links.detect { |link| link =~ /watch/ }.gsub("/watch?v=","")
    end

    def playlist_url(video_ids)
      multiple_ids_url = URL + "/watch_videos?video_ids="
      multiple_ids_url + video_ids.join(",")
    end
  end
end
