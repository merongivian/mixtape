require 'test_helper'

describe Mixtape::Youtube, :vcr do
  describe ".search_id" do
    it "gets the first url for a search" do
      song = "radiohead karma police"
      song_id = Mixtape::Youtube.video_id(song)
      song_id.must_equal 'IBH97ma9YiI'
    end
  end

  describe ".playlist_url" do
    it "returns a url for a list of youtube id's" do
      video_ids = %w(IBH97ma9YiI bx1Bh8ZvH84 ypr18UmxOas)
      url  = Mixtape::Youtube.playlist_url(video_ids)
      url.must_equal "http://www.youtube.com/watch_videos?video_ids=" \
                     "IBH97ma9YiI,bx1Bh8ZvH84,ypr18UmxOas"
    end
  end
end
