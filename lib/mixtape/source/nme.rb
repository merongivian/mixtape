module Mixtape
  module Source
    module Nme
      def self.best_new_tracks
        nme_metainspector = MetaInspector.new("http://www.nme.com/reviews/onrepeat")
        links = nme_metainspector.links.raw
        songs_links = links.select{ |link| link =~ /various-artists/ }
        ids = songs_links.map{ |link| link.gsub("/reviews/various-artists/","") }

        page_one_songs = best_new_tracks_for_page_id(ids[0])
        page_three_songs = best_new_tracks_for_page_id(ids[2])
        page_five_songs = best_new_tracks_for_page_id(ids[4])

        page_one_songs.sample(5) +
          page_three_songs.sample(3) +
            page_five_songs.sample(2)
      end

      private

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
