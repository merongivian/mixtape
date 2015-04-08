module Mixtape
  module Source
    class Stereogum < Base
      private

      def songs_for_page_id(page_number)
        page_info = Mixtape::MusicBlogInfo.new(
          url: "http://www.stereogum.com",
          tracks_subpath: "/music/page"
        )
        page_info.tracks(
          page_id: page_number,
          css_query: '.feed .post h2 > a'
        )
      end
    end
  end
end
