require 'nokogiri'
require 'open-uri'

module Mixtape
  module Source
    module Pitchfork
      def self.songs
        sliced_songs = 1.upto(8).map { |page| best_new_tracks_for_page(page) }
        random_songs = Mixtape::RandomSongs.new(sliced_songs)
        random_songs.most_recent_pick(3, by: 1)
      end

      private

      def self.best_new_tracks_for_page(page_number)
        page = Nokogiri::HTML(
          open("http://pitchfork.com/reviews/best/tracks/#{page_number}/")
        )
        page.css('.object-list > li .info h1 a').map do |node|
          Song.new(
            node.at_css('.artist').content.delete("^a-zA-Z0-9 ").strip,
            node.at_css('.title').content.delete("^a-zA-Z0-9/ ").strip
          )
        end
      end
    end
  end
end
