require 'test_helper'

describe Mixtape do
  describe ".playlist" do
    it "returns a list of youtube links from recommended songs" do
      result = [
        {
          artist: "radiohead",
          song: "karma police"
        },
        {
          artist: "oasis",
          song: "wonderwall"
        },
        {
          artist: "garbage",
          song: "i think i'm paranoid"
        }
      ]

      Mixtape::Pitchfork.stubs(:best_new_tracks)
        .returns(result)

      youtube_ids = %w(IBH97ma9YiI bx1Bh8ZvH84 ypr18UmxOas)
      Mixtape.pitchfork_playlist.must_equal youtube_ids
    end
  end
end
