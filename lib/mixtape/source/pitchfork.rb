require 'nokogiri'
require 'open-uri'

module Mixtape
  module Source
    module Pitchfork
      def self.songs
        sliced_songs = 1.upto(8).map { |page| tracks_for_page(page) }
        random_songs = Mixtape::RandomSongs.new(sliced_songs)
        random_songs.most_recent_pick(3, by: 1)
      end

      private

      def self.tracks_for_page(page_number)
        page_info = Mixtape::MusicBlogInfo.new(
          url: "http://pitchfork.com",
          tracks_subpath: "/reviews/best/tracks"
        )
        page_info.tracks(
          page_id: page_number,
          css_query: '.object-list > li .info h1 a'
        )
      end
    end
  end
end
