require 'launchy'

module Mixtape
  class CLI
    class InvalidSource < StandardError; end

    def initialize(source_name, number_of_songs)
      source_constant = Mixtape::Source.const_get(source_name.capitalize)
      @source = source_constant.new(number_of_songs)
      rescue NameError; raise InvalidSource
    end

    def open_playlist
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
      playlist =  Mixtape::YoutubePlaylist.new(@source.songs)
      Launchy.open(playlist.url)
    end
  end
end
