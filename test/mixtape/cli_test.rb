require 'test_helper'

describe Mixtape::CLI do
  describe ".youtube_playlist" do
    it "opens a playlist youtube link" do
      ids = %w(id_one id_two)
      pitchfork_playlist_url = "www.youtube_playlist_url..."
      Mixtape.expects(:pitchfork_playlist).returns(ids)
      Mixtape::Youtube.expects(:playlist_url).with(ids).returns(pitchfork_playlist_url)
      Launchy.expects(:open).with(pitchfork_playlist_url)

      Mixtape::CLI.open_playlist
    end
  end
end
