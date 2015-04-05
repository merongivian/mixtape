require 'pmap'

module Mixtape
  module Source
    module Nme
      @page_info = Mixtape::MusicBlogInfo.new(
        url: "http://www.nme.com",
        tracks_subpath: "/reviews/various-artists"
      )

      def self.songs
        ids = @page_info.lists_links_ids("/reviews/onrepeat")
        pages = [0, 2, 4]

        sliced_songs = pages.map{ |page| tracks_for_page_id(ids.at page) }
        random_songs = Mixtape::RandomSongs.new(sliced_songs)
        random_songs.most_recent_pick(5, by: 3).first(10)
      end

      private

      def self.tracks_for_page_id(page_id)
        @page_info.tracks(
          page_id: page_id,
          css_query: '.article_text.columns > .onrepeat strong'
        )
      end
    end
  end
end
