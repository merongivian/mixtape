require 'test_helper'

describe Mixtape::Youtube, :vcr do
  describe ".search_id" do
    it "gets the first url for a search" do
      song = "radiohead karma police"
      song_id = Mixtape::Youtube.video_id(song)
      song_id.must_equal 'IBH97ma9YiI'
    end
  end
end
