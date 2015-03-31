require 'launchy'

module Mixtape
  module CLI
    def self.open_playlist
      url = Mixtape::PlaylistURL.pitchfork
      Launchy.open url
    end
  end
end
