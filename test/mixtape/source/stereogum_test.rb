require 'test_helper'

describe Mixtape::Source::Stereogum, vcr: { record: :once } do
  let(:number_of_songs) { 10 }
  let(:stereogum) { Mixtape::Source::Stereogum.new(number_of_songs) }

  describe "#songs" do
    let(:first_page_songs) do [
      "Ben Browning – “Make It Easy”",
      "Fake Palms – “Sun Drips” (Stereogum Premiere)",
      "Kenny Knight – “Whiskey” (Stereogum Premiere)",
      "iji – “Hard 2 Wait” (Stereogum Premiere)",
      "ADVAETA – “Church Cult” (Stereogum Premiere)",
      "River Tiber – “Motives” (Stereogum Premiere)",
      "Bully – “Trying” (Stereogum Premiere)",
      "Vicktor Taiwò – “Feathers & Wax” (Stereogum Premiere)",
      "Preview Kanye West’s “U Mad” And Kendrick Lamar’s “All Day” Remix",
      "Bent Denim – “City Of Gardens” (Stereogum Premiere)",
      "Download Curren$y Pilot Talk III",
      "Van Hunt – “Old Hat” (Stereogum Premiere)",
      "St. Vincent – “Teenage Talk” (Full Version)",
      "Billie Marten – “Heavy Weather” (Stereogum Premiere)",
      "Someone Mashed Up Carly Rae Jepsen With Nine Inch Nails Again, And We Really Really Like It",
      "Jeremih – “Tonight Belongs To U!” (Feat. Flo Rida)",
      "Cold Cave – “Nausea, The Earth And Me”",
      "Metz – “Spit You Out”",
      "Sam Smith – “Lay Me Down (Flume Remix)”",
      "Desaparecidos – “City On The Hill” + Payola Details",
      "The Staves – “Make It Holy” (Feat. Justin Vernon) Video (Stereogum Premiere)",
      "Blur – “Lonesome Street” Video",
      "Stream Shana Falana Set Your Lightning Fire Free (Stereogum Premiere)",
      "Stream Young Fathers White Men Are Black Men Too", "The Black Market: The Month In Metal – March 2015"
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
