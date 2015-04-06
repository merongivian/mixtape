require 'metainspector'

module Mixtape
  class YoutubePlaylist
    class InvalidSource < StandardError; end
    URL = "http://youtube.com"

    def initialize(songs)
      @songs = songs
    end

    def url
      ids = @songs.pmap do |song|
        video_id(song)
      end
      playlist_url ids
    end

    private

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
