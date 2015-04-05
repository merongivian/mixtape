require 'test_helper'

describe Mixtape::Source::Nme, vcr: { record: :once } do
  describe ".songs" do
    let(:first_page_songs) do [
      Mixtape::Song.new("The Maccabees", "'Marks To Prove It'"),
      Mixtape::Song.new("Florence + The Machine", "St Jude"),
      Mixtape::Song.new("Brandon Flowers", "Dreams Come True"),
      Mixtape::Song.new("Muse ", "Dead Inside"),
      Mixtape::Song.new("Brian Wilson", "Sail Away"),
      Mixtape::Song.new("Dutch Uncles", "Realm"),
      Mixtape::Song.new("Shamir", "Call It Off"),
      Mixtape::Song.new("Wale, Kanye West & Ty Dolla $ign", "The Summer League"),
      Mixtape::Song.new("Communions", "Out Of My World"),
      Mixtape::Song.new("Du Blonde", "Mind Is On My Mind"),
      Mixtape::Song.new("Antwon", "Jacuzzi (feat. Lushlife)"),
      Mixtape::Song.new("Earl Sweatshirt & Action Bronson", "Warlord Leather"),
      Mixtape::Song.new("Wolf Alice", "I Saw You (In A Corridor)"),
      Mixtape::Song.new("Jamie xx", "Loud Places (feat. Romy)"),
      Mixtape::Song.new("Donald Cumming", "Game Of The Heart"),
      Mixtape::Song.new("Leftfield", "Universal Everything"),
      Mixtape::Song.new("FKA Twigs", "Glass & Patron"),
      Mixtape::Song.new("Summer Camp", "Bad Love"),
      Mixtape::Song.new("Ceremony", "The Separation"),
      Mixtape::Song.new("Blur", "Lonesome Street"),
    ] end

    let(:top_ten_tracks) { Mixtape::Source::Nme.songs }

    it "returns 10 songs" do
      top_ten_tracks.length.must_equal 10
    end

    it "takes songs them from nme's best new tracks" do
      assert first_page_songs.any? { |song| top_ten_tracks.include? song }
    end

    it 'picks them randomly' do
      more_top_ten_tracks = Mixtape::Source::Nme.songs
      more_top_ten_tracks.wont_equal top_ten_tracks
    end
  end
end
