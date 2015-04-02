require 'test_helper'

describe Mixtape::Source::Pitchfork, vcr: { record: :once } do
  describe ".best_new_tracks" do
    let(:first_page_songs) do [
      Mixtape::Song.new("iLoveMakonnen", "Whip It Remix ft Migos and Rich the Kid"),
      Mixtape::Song.new("Cakes Da Killa", "Serve It Up"),
      Mixtape::Song.new("Jamie xx","Gosh"),
      Mixtape::Song.new("Prurient","Dragonflies to Sew You Up"),
      Mixtape::Song.new("Jamie xx","Loud Places ft Romy"),
    ] end

    let(:top_ten_tracks) { Mixtape::Source::Pitchfork.best_new_tracks }

    it "returns 10 songs" do
      top_ten_tracks.length.must_equal 10
    end

    it "takes them from pitchfork's best new tracks" do
      assert first_page_songs.any? { |song| top_ten_tracks.include? song }
    end

    it 'picks them randomly' do
      more_top_ten_tracks = Mixtape::Source::Pitchfork.best_new_tracks
      more_top_ten_tracks.wont_equal top_ten_tracks
    end
  end
end
