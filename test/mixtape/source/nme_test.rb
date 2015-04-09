# encoding: utf-8
require 'test_helper'

describe Mixtape::Source::Nme, vcr: { record: :once } do
  let(:number_of_songs) { 10 }
  let(:nme) { Mixtape::Source::Nme.new(number_of_songs) }

  describe "#songs" do
    let(:first_page_songs) do [
      "The Maccabees - 'Marks To Prove It'",
      "Florence + The Machine - St Jude",
      "Brandon Flowers - Dreams Come True",
      "Muse  - Dead Inside",
      "Brian Wilson - Sail Away",
      "Dutch Uncles - Realm",
      "Shamir - Call It Off",
      "Wale, Kanye West & Ty Dolla $ign - The Summer League",
      "Communions - Out Of My World",
      "Du Blonde - Mind Is On My Mind",
      "Antwon - Jacuzzi (feat. Lushlife)",
      "Earl Sweatshirt & Action Bronson - Warlord Leather",
      "Wolf Alice - I Saw You (In A Corridor)",
      "Jamie xx - Loud Places (feat. Romy)",
      "Donald Cumming - Game Of The Heart",
      "Leftfield - Universal Everything",
      "FKA Twigs - Glass & Patron",
      "Summer Camp - Bad Love",
      "Ceremony - The Separation",
      "Blur - Lonesome Street"
    ] end

    let(:top_ten_tracks) { nme.songs }

    it "returns 10 songs" do
      top_ten_tracks.length.must_equal 10
    end

    it "takes songs them from nme's best new tracks" do
      assert first_page_songs.any? { |song| top_ten_tracks.include? song }
    end

    it 'picks them randomly' do
      more_top_ten_tracks = nme.songs
      more_top_ten_tracks.wont_equal top_ten_tracks
    end
  end
end
