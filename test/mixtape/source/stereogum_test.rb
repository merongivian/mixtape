require 'test_helper'

describe Mixtape::Source::Stereogum, vcr: { record: :once } do
  let(:number_of_songs) { 10 }
  let(:stereogum) { Mixtape::Source::Stereogum.new(number_of_songs) }

  describe "#songs" do
    let(:first_page_songs) do [
      "Pinkwash – “Cancer Money” & “Skin”",
      "Slonk Donkerson – “Painted From Memory” (Stereogum Premiere)",
      "Chief Keef – “Faneto (Remix)” (Feat. Lil Bibby, Lil Herb, King Louie & Lil Durk)",
      "The National – “Sunshine On My Back”",
      "Hear The Rolling Stones’ Acoustic “Wild Horses” From Sticky Fingers Reissue",
      "D.R.A.M. – “Excessive”",
      "Sharpless – “Franz Kafka” (Home Movies Cover)",
      "Preview A Previously Unreleased White Stripes Recording From Third Man Records’ Latest Vault Package",
      "Haleek Maul – “Kingdom Come”",
      "Prinzhorn Dance School – “Reign”",
      "Ronnie Stone & The Lonely Riders – “Kiss The Daddy” (Stereogum Premiere)",
      "Baauer – “Promises” (Feat. Fetty Wap & Dubbel Dutch)",
      "Flagland – “Awesome Song, Kerry Jan” (Stereogum Premiere)",
      "Hot Chip – “Atomic Bomb (John Talabot Remix)” (William Onyeabor Cover)",
      "Herbert – “Strong”",
      "FFS (Franz Ferdinand & Sparks) – “Piss Off”",
      "Active Child – “Never Far Away”",
      "Palma Violets – “English Tongue”",
      "Avid Dancer – “Not Far To Go”",
      "Eskimeaux – “I Admit I’m Scared”"
    ] end

    let(:top_ten_tracks) { stereogum.songs }

    it "returns 10 songs" do
      top_ten_tracks.length.must_equal 10
    end

    it "takes them from stereogum's best new tracks" do
      assert first_page_songs.any? { |song| top_ten_tracks.include? song }
    end

    it 'picks them randomly' do
      more_top_ten_tracks = stereogum.songs
      more_top_ten_tracks.wont_equal top_ten_tracks
    end
  end
end
