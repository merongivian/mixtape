require 'test_helper'

describe Mixtape::PlaylistURL, :vcr do
  describe ".pitchfork" do
    it "returns a youtube url for pitchfork's recommendations" do
      Mixtape::Pitchfork.stubs(:best_new_tracks).returns [
        Mixtape::Song.new("radiohead", "karma police"),
        Mixtape::Song.new("oasis", "wonderwall"),
        Mixtape::Song.new("blur", "song 2")
      ]
      playlist_url = "http://www.youtube.com/watch_videos?video_ids=" \
                                "IBH97ma9YiI,bx1Bh8ZvH84,SSbBvKaM6sk"

      Mixtape::PlaylistURL.pitchfork.must_equal playlist_url
    end
  end
end
