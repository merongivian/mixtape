require 'test_helper'

describe Mixtape::CLI, :vcr do
  let(:number_of_songs) { 3 }

  describe "#initialize" do
    it "raises an error for an invalid source" do
      ->{ Mixtape::CLI.new('billboard', number_of_songs) }
        .must_raise Mixtape::CLI::InvalidSource
    end

    it "creates the source" do
      Mixtape::Source::Nme.expects(:new).with(number_of_songs)
      Mixtape::CLI.new('nme', number_of_songs)
    end
  end

  describe "#open_playlist" do
    it "opens the youtube playlist url" do
      url = "http://youtube.com/watch_videos?video_ids=" \
                     "IBH97ma9YiI,bx1Bh8ZvH84,SSbBvKaM6sk"

      nme =  Mixtape::Source::Nme.new(number_of_songs)
      nme.stubs(:songs).returns [
        "radiohead - karma police",
        "oasis - wonderwall",
        "blur - song 2"
      ]
      assert nme.respond_to? :songs

      Mixtape::Source::Nme.stubs(:new).with(number_of_songs).returns(nme)
      cli = Mixtape::CLI.new('nme', number_of_songs)

      Launchy.expects(:open).with(url)
      cli.open_playlist
    end
  end
end
