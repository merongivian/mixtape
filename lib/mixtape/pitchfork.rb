require 'nokogiri'
require 'open-uri'

module Mixtape
  module Pitchfork
    def self.best_new_tracks
      best_new_tracks_for_page(1)[0..2] + (2..8).map do |page|
        random_index = rand(0..4)
        best_new_tracks_for_page(page)[random_index]
      end
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
