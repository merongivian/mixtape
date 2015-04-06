require 'pmap'
require_relative 'base'

module Mixtape
  module Source
    class Nme < Base
      private

      def pages_ids
        page_info.lists_links_ids("/reviews/onrepeat").first(@number_of_songs)
      end

      def songs_for_page_id(page_id)
        page_info.tracks(
          page_id: page_id,
          css_query: '.article_text.columns > .onrepeat strong'
        )
      end

      def page_info
        Mixtape::MusicBlogInfo.new(
          url: "http://www.nme.com",
          tracks_subpath: "/reviews/various-artists"
        )
      end
    end
  end
end
