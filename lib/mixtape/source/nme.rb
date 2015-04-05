require 'pmap'

module Mixtape
  module Source
    module Nme
      def self.songs
        ids = pages_ids
        pages = [0, 2, 4]

        sliced_songs = pages.map{ |page| best_new_tracks_for_page_id(ids.at page) }

        random_songs = Mixtape::RandomSongs.new(sliced_songs)
        random_songs.most_recent_pick(5, by: 3).first(10)
      end

      private

      def self.pages_ids
        nme_metainspector = MetaInspector.new("http://www.nme.com/reviews/onrepeat")
        links = nme_metainspector.links.raw
        songs_links = links.select{ |link| link =~ /various-artists/ }
        songs_links.map{ |link| link.gsub("/reviews/various-artists/","") }
      end

      def self.best_new_tracks_for_page_id(page_id)
        page = Nokogiri::HTML(
          open("http://www.nme.com/reviews/various-artists/#{page_id}")
        )
        page.css('.article_text.columns > .onrepeat').map do |node|
          song_info = node.at_css('strong').content.strip.split(" - ")
          Song.new(
            song_info.first,
            song_info.last
          )
        end
      end
    end
  end
end
