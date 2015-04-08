module Mixtape
  class CLI
    class InvalidSource < StandardError; end

    def initialize(source_name, number_of_songs)
      source_constant = Mixtape::Source.const_get(source_name.capitalize)
      @source = source_constant.new(number_of_songs)
      @source_name = source_name
      rescue NameError; raise InvalidSource
    end

    def open_playlist
      system "echo 'Creating mixtape...'"
      playlist =  Mixtape::YoutubePlaylist.new(@source.songs)
      launch = Thread.new { Launchy.open(playlist.url) }
      mixtape_animation = Thread.new { awesome_output }
      mixtape_animation.join
      launch.join
    end

    private

    def awesome_output
      num_of_spaces = (26 - @source_name.length)/2
      spaces = " " * num_of_spaces
      title = spaces + @source_name + spaces
      mixtape_title = "| |:#{title} :|"
      tape = <<-TAPE
         ____________________________
       /|............................|
      | |:      AwesomeMixtape      :|
      #{mixtape_title}
      | |:     ,-.   _____   ,-.    :|
      | |:    ( `)) [_____] ( `))   :|
      |v|:     `-`   , , ,   `-`    :|
      |||:     ,______________.     :|
      |||...../::::o::::::o:::::.....|
      |^|..../:::O::::::::::O::::....|
      |/`---/--------------------`---|
      `.___/ /====/ /=//=/ /====/,___/
           `--------------------.
      TAPE

      system "echo '#{tape}' | lolcat --animate"
    end
  end
end
