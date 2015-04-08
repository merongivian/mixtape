require 'test_helper'

describe Mixtape::Source::Pap, vcr: { record: :once } do
  let(:number_of_songs) { 10 }
  let(:pap) { Mixtape::Source::Pap.new(number_of_songs) }

  describe ".songs" do
    let(:first_page_songs) do [
      "Rapsody ft. Merna – “Don’t Need It” (Prod. by Young Guru)",
      "Stream Kevin Garrett’s “Mellow Drama” EP",
      "Slime – “My Company”",
      "Jay Bel feat. Jimi Tents – “TransEuro”",
      "Virginia Is For (Rap) Lovers",
      "EP Premiere: Flaxo – “Sleepover”",
      "Henry Green – “Barcelona”",
      "Blank Body – “Opal Ease” and “Highrise”",
      "Kevin Abstract ft. Matt Champion and Ameer Vann – “NOT ON DOASM 01″",
      "Listen to Robb Bank$ & Chris Travis’ ‘No Trespassing’ EP"
    ] end

    let(:top_ten_tracks) { pap.songs }

    it "returns 10 songs" do
      top_ten_tracks.length.must_equal 10
    end

    it "takes songs them from pap's best new tracks" do
      assert first_page_songs.any? { |song| top_ten_tracks.include? song }
    end

    it 'picks them randomly' do
      more_top_ten_tracks = pap.songs
      more_top_ten_tracks.wont_equal top_ten_tracks
    end
  end
end
