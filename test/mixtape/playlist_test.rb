require 'test_helper'

describe Mixtape::PlaylistURL, :vcr do
  describe "#url" do
    it "returns a youtube url for a valid source" do
      Mixtape::Source::Nme.stubs(:best_new_tracks).returns [
        Mixtape::Song.new("radiohead", "karma police"),
        Mixtape::Song.new("oasis", "wonderwall"),
        Mixtape::Song.new("blur", "song 2")
      ]
      playlist_url = "http://www.youtube.com/watch_videos?video_ids=" \
                                "IBH97ma9YiI,bx1Bh8ZvH84,SSbBvKaM6sk"

      Mixtape::PlaylistURL.best_new_tracks('nme').must_equal playlist_url
    end

    it "raises an error for invalid an invalid source" do
      ->{ Mixtape::PlaylistURL.best_new_tracks('invalid') }
        .must_raise Mixtape::PlaylistURL::InvalidSource
    end
  end
end
