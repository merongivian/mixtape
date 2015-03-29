require 'metainspector'

module Mixtape
  module Youtube
    URL = "youtube.com/results?search_query=%s"

    def self.video_id(search)
      search_query = search.gsub(/\s+/, "+")
      metainspector = MetaInspector.new(URL % search_query)
      links = metainspector.links.raw
      links.detect { |link| link =~ /watch/ }.gsub("/watch?v=","")
    end

    def self.playlist_url(video_ids)
      "http://www.youtube.com/watch_videos?video_ids=" + video_ids.join(",")
    end
  end
end
