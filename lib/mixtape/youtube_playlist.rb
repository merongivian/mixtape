require 'metainspector'

module Mixtape
  class YoutubePlaylist
    class InvalidSource < StandardError; end
    URL = "http://youtube.com"

    def initialize(songs)
      @songs = songs
    end

    def url
      #TODO deal with imposible searches in each source before sending them to youtube
      #, until then i'll use compact and return less songs
      ids = @songs.pmap do |song|
        video_id(song)
      end.compact
      playlist_url ids
    end

    private

    def video_id(search)
      search_query = search.gsub(/\s+/, "+")
      search_url = URL + "/results?search_query=" + search_query
      youtube_metainspector = MetaInspector.new(search_url)
      links = youtube_metainspector.links.raw
      video_link = links.detect { |link| link =~ /watch/ }
      video_link.gsub("/watch?v=","") unless video_link.nil?
    end

    def playlist_url(video_ids)
      multiple_ids_url = URL + "/watch_videos?video_ids="
      multiple_ids_url + video_ids.join(",")
    end
  end
end
