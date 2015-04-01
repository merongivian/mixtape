require 'launchy'

module Mixtape
  module CLI
    def self.open_playlist(source)
      system "echo '   ____________________________'"
      system "echo ' /|............................|'"
      system "echo '| |:      AwesomeMixtape      :|'"
      system "echo '| |:                          :|'"
      system "echo '| |:     ,-.   _____   ,-.    :|'"
      system "echo '| |:    ( `)) [_____] ( `))   :|'"
      system "echo '|v|:     `-`   , , ,   `-`    :|'"
      system "echo '|||:     ,______________.     :|'"
      system "echo '|||...../::::o::::::o:::::.....|'"
      system "echo '|^|..../:::O::::::::::O::::....|'"
      system "echo '|/`---/--------------------`---|'"
      system "echo '`.___/ /====/ /=//=/ /====/,___/'"
      system "echo '     `--------------------.'"
      url = Mixtape::PlaylistURL.best_new_tracks(source)
      Launchy.open url
    end
  end
end
