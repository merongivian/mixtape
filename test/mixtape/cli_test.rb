require 'test_helper'

describe Mixtape::CLI, :vcr do
  describe ".youtube_playlist" do
    it "opens a playlist youtube link" do
      pitchfork_playlist_url = "http://www.youtube.com/watch_videos?video_ids=" \
                               "pFf3fNAwJsY,3dgFykz0bNo,TP9luRtEqjc,HxMLzZmZE3I," \
                               "xGMgwERhfcI,tZ5Mu2gs-M8,KiXqcwljveo,cinJDxLUsNY," \
                               "fHaL2jwWnl4,3m42g0Bpg7o"
      Launchy.expects(:open).with(pitchfork_playlist_url)

      Mixtape::CLI.open_playlist
    end
  end
end
