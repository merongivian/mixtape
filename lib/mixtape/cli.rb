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
      youtube_playlist = Mixtape::YoutubePlaylist.new(source)
      Launchy.open(youtube_playlist.url)
    end
  end
end
