module Mixtape
  module Source
    class Indieshuffle < Base
      private

      def pages_ids
        page_info.lists_links_ids("/popular/month/month").first(@number_of_songs)
      end

      def songs_for_page_id(page_id)
        page_info.tracks(
          page_id: page_id,
          css_query: '.songMidContent .pink.ajaxlink'
        )
      end

      def page_info
        Mixtape::MusicBlogInfo.new(
          url: "http://www.indieshuffle.com",
          tracks_subpath: '/popular/month'
        )
      end
    end
  end
end
