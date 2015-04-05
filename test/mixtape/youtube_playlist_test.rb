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
      Mixtape::Source::Nme.stubs(:songs).returns [
        "radiohead - karma police",
        "oasis - wonderwall",
        "blur - song 2"
      ]
      playlist_url = "http://youtube.com/watch_videos?video_ids=" \
                                "IBH97ma9YiI,bx1Bh8ZvH84,SSbBvKaM6sk"

      youtube_playlist = Mixtape::YoutubePlaylist.new('nme')

      assert Mixtape::Source::Nme.respond_to?(:songs)
      youtube_playlist.url.must_equal playlist_url
    end
  end
end
