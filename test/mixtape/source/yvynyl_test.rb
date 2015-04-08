require 'test_helper'

describe Mixtape::Source::Yvynyl, vcr: { record: :once } do
  let(:number_of_songs) { 10 }
  let(:yvynyl) { Mixtape::Source::Yvynyl.new(number_of_songs) }

  describe "#songs" do
    let(:first_page_songs) do [
      "Indoor Voices - What Can I (feat. Alisha Erao)",
      "Nani Castle - Peach Brown",
      "Trails and Ways - Skeletons",
      "Dive In - Eighteen",
      "Bully - Milkman",
      "Alpine - Foolish",
      "Postäal - Don’t Let Go",
      "solhee - 안읽씹",
      "Makeup and Vanity Set - Hand in Hand",
      "Heron Oblivion - The Desert",
      "Feivel - Already Standing"
    ] end

    let(:top_ten_tracks) { yvynyl.songs }

    it "returns 10 songs" do
      top_ten_tracks.length.must_equal 10
    end

    it "takes them from yvynyl's best new tracks" do
      assert first_page_songs.any? { |song| top_ten_tracks.include? song }
    end

    it 'picks them randomly' do
      more_top_ten_tracks = yvynyl.songs
      more_top_ten_tracks.wont_equal top_ten_tracks
    end
  end
end
