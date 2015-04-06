module Mixtape
  module Source
    class Diy < Base
      private

      def songs_for_page_id(page_number)
        page_info = Mixtape::MusicBlogInfo.new(
          url: "http://diymag.com",
          tracks_subpath: "/reviews/track"
        )
        page_info.tracks(
          page_id: "page-#{page_number}",
          css_query: 'h3.h-headline a'
        )
      end
    end
  end
end
