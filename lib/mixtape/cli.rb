require 'launchy'

module Mixtape
  module CLI
    def self.open_playlist
      ids = Mixtape.pitchfork_playlist
      url = Mixtape::Youtube.playlist_url ids
      Launchy.open url
    end
  end
end
