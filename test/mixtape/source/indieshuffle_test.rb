require 'test_helper'

describe Mixtape::Source::Indieshuffle, :vcr do
  let(:number_of_songs) { 10 }
  let(:indieshuffle) { Mixtape::Source::Indieshuffle.new(number_of_songs) }

  describe "#songs" do
    let(:first_page_songs) do [
      "Of Monsters and Men\n Crystals",
      "Jamie xx\n Loud Places (Ft. Romy Madley-Croft)",
      "Alpine\n Foolish",
      "HONNE\n Coastal Love",
      "Tame Impala\n Cause I'm A Man",
      "Al Bairre\n Bungalow",
      "Bakermat\n Another Man",
      "Florence And The Machine\n St. Jude"
    ] end

    let(:top_ten_tracks) { indieshuffle.songs }

    it "returns 10 songs" do
      value(top_ten_tracks.length).must_equal 10
    end

    it "takes songs them from indieshuffle's best new tracks" do
      assert first_page_songs.any? { |song| top_ten_tracks.include? song }
    end

    it 'picks them randomly' do
      more_top_ten_tracks = indieshuffle.songs
      value(more_top_ten_tracks).wont_equal top_ten_tracks
    end
  end
end
