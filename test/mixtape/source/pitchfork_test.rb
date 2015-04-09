# encoding: utf-8
require 'test_helper'

describe Mixtape::Source::Pitchfork, vcr: { record: :once } do
  let(:number_of_songs) { 10 }
  let(:pitchfork) { Mixtape::Source::Pitchfork.new(number_of_songs) }

  describe "#songs" do
    let(:first_page_songs) do [
      "iLoveMakonnen: \"Whip It (Remix)\" [ft. Migos and Rich the Kid]",
      "Cakes Da Killa: \"Serve It Up\"",
      "Jamie xx: \"Gosh\"",
      "Prurient: \"Dragonflies to Sew You Up\"",
      "Jamie xx: “Loud Places” [ft. Romy]",
    ] end

    let(:top_ten_tracks) { pitchfork.songs }

    it "returns 10 songs" do
      top_ten_tracks.length.must_equal 10
    end

    it "takes them from pitchfork's best new tracks" do
      assert first_page_songs.any? { |song| top_ten_tracks.include? song }
    end

    it 'picks them randomly' do
      more_top_ten_tracks = pitchfork.songs
      more_top_ten_tracks.wont_equal top_ten_tracks
    end
  end
end
