require 'test_helper'

describe Mixtape::YoutubePlaylist, :vcr do
  describe "#initialize" do
    it "raises an error for invalid an invalid source" do
      ->{ Mixtape::YoutubePlaylist.new('billboard') }
        .must_raise Mixtape::YoutubePlaylist::InvalidSource
    end
  end

  describe "#url" do
    it "returns a youtube url for a valid source" do
      Mixtape::Source::Nme.expects(:best_new_tracks).returns [
        Mixtape::Song.new("radiohead", "karma police"),
        Mixtape::Song.new("oasis", "wonderwall"),
        Mixtape::Song.new("blur", "song 2")
      ]
      playlist_url = "http://youtube.com/watch_videos?video_ids=" \
                                "IBH97ma9YiI,bx1Bh8ZvH84,SSbBvKaM6sk"

      Mixtape::YoutubePlaylist.new('nme').url.must_equal playlist_url
    end
  end
end
