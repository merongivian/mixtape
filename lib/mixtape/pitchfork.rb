require 'nokogiri'
require 'open-uri'

module Mixtape
  module Pitchfork
    def self.best_new_tracks
      best_new_tracks_for_page(1) + best_new_tracks_for_page(2)
    end

    private

    def self.best_new_tracks_for_page(page_number)
      page = Nokogiri::HTML(
        Kernel.open("http://pitchfork.com/reviews/best/tracks/#{page_number}/")
      )
      page.css('.object-list > li .info h1 a').map do |node|
        {
          artist: node.at_css('.artist').content.delete("^a-zA-Z0-9 ").strip,
          song: node.at_css('.title').content.delete("^a-zA-Z0-9 ").strip
        }
      end
    end
  end
end
