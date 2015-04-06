require 'nokogiri'
require 'open-uri'
require_relative 'base'

module Mixtape
  module Source
    class Pitchfork < Base
      private

      def songs_for_page_id(page_number)
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
