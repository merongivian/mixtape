require 'test_helper'

describe Mixtape, :vcr do
  describe ".playlist" do
    it "returns a list of youtube links from recommended songs" do
      pitchfork_ids = %w(pFf3fNAwJsY 3dgFykz0bNo TP9luRtEqjc HxMLzZmZE3I xGMgwERhfcI tZ5Mu2gs-M8 KiXqcwljveo cinJDxLUsNY fHaL2jwWnl4 3m42g0Bpg7o)
      Mixtape.pitchfork_playlist.must_equal pitchfork_ids
    end
  end
end
