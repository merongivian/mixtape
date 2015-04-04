require 'test_helper'

describe Mixtape::CLI do
  describe ".open_playlist" do
    it "opens a playlist with a youtube link for a source" do
      url = "www.youtube.com/..."
      source = 'pitchfork'
      youtube_playlist = Mixtape::YoutubePlaylist.new(source)
      youtube_playlist.stubs(:url).returns(url)

      Mixtape::YoutubePlaylist.expects(:new).with(source).returns(youtube_playlist)
      Launchy.expects(:open).with(url)

      Mixtape::CLI.open_playlist(source)
    end
  end
end
