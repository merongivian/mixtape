require 'test_helper'

describe Mixtape::Source::Diy, vcr: { record: :once } do
  let(:number_of_songs) { 10 }
  let(:diy) { Mixtape::Source::Diy.new(number_of_songs) }

  describe "#songs" do
    let(:first_page_songs) do [
      "Tame Impala - ‘Cause I’m A Man",
      "Hot Chip - Need You Now",
      "The National - Sunshine on my Back",
      "Ben Khan - Zenith",
      "The Maccabees - Marks To Prove It",
      "The Vaccines - Dream Lover",
      "Jamie xx - Gosh",
      "Drenge - Favourite Son",
      "Hop Along - Powerful Man",
      "Action Bronson x Earl Sweatshirt - Warlord Leather",
      "Hudson Mohawke - Very First Breath",
      "Blur - Lonesome Street",
      "Jamie xx - Loud Places",
      "Brandon Flowers - Can’t Deny My Love",
      "Wolf Alice - I Saw You (In A Corridor)",
      "Django Django - Reflections",
      "Grimes x Bleachers - Entropy",
      "Death Cab For Cutie - Little Wanderer",
      "Kero Kero Bonito - Picture This",
      "Muse - Psycho",
      "Warpaint - I’ll Start Believing"
    ] end

    let(:top_ten_tracks) { diy.songs }

    it "returns 10 songs" do
      top_ten_tracks.length.must_equal 10
    end

    it "takes them from diy's best new tracks" do
      assert first_page_songs.any? { |song| top_ten_tracks.include? song }
    end

    it 'picks them randomly' do
      more_top_ten_tracks = diy.songs
      more_top_ten_tracks.wont_equal top_ten_tracks
    end
  end
end
