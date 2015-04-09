require 'test_helper'

describe Mixtape::YoutubePlaylist, vcr: { record: :once } do
  describe "#url" do
    it "returns a youtube url for songs" do
      playlist_url = "http://youtube.com/watch_videos?video_ids=" \
                     "IBH97ma9YiI,bx1Bh8ZvH84,SSbBvKaM6sk"

      songs = ["radiohead - karma police",
               "oasis - wonderwall",
               "blur - song 2"]

      youtube_playlist = Mixtape::YoutubePlaylist.new(songs)
      youtube_playlist.url.must_equal playlist_url
    end

    it "skips a song if the search returns nothing" do
      playlist_url = "http://youtube.com/watch_videos?video_ids=IBH97ma9YiI,bx1Bh8ZvH84"
      songs = ["radiohead - karma police",
               "oasis - wonderwall",
               "ayicho popo dsfsd asdf asdf adsdsa"]

      youtube_playlist = Mixtape::YoutubePlaylist.new(songs)
      youtube_playlist.url.must_equal playlist_url
    end
  end
end
