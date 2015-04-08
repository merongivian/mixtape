module Mixtape
  module Source
    class Pap < Base
      private

      def songs_for_page_id(page_number)
        page_info = Mixtape::MusicBlogInfo.new(
          url: "http://pigeonsandplanes.com",
          tracks_subpath: "/category/audio/page"
        )
        page_info.tracks(
          page_id: page_number,
          css_query: '.contentwrap .postwrap h2 a'
        )
      end
    end
  end
end
