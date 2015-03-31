require 'test_helper'

describe Mixtape::CLI do
  describe ".open_playlist" do
    it "opens a playlist youtube link" do
      url = "www.youtube.com/..."
      Mixtape::PlaylistURL.stubs(:pitchfork).returns(url)
      Launchy.expects(:open).with(url)

      Mixtape::CLI.open_playlist
    end
  end
end
