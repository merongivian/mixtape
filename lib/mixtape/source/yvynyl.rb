module Mixtape
  module Source
    class Yvynyl < Base
      private

      def songs_for_page_id(page_number)
        page_info = Mixtape::MusicBlogInfo.new(
          url: 'http://yvynyl.com',
          tracks_subpath: "/page"
        )
        page_info.tracks(
          page_id: page_number,
          css_query: '.article-content .caption p:first-child'
        ).select{ |track| track.include? "-" }
      end
    end
  end
end
