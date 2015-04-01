require 'test_helper'

describe Mixtape::CLI do
  describe ".open_playlist" do
    it "opens a playlist with a youtube link for a source" do
      url = "www.youtube.com/..."
      source = 'pitchfork'
      Mixtape::PlaylistURL.expects(:best_new_tracks).with(source).returns(url)
      Launchy.expects(:open).with(url)

      Mixtape::CLI.open_playlist(source)
    end
  end
end
