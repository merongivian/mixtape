require 'test_helper'

describe Mixtape::Pitchfork, :vcr do
  describe ".best_new_tracks" do
    it "picks three songs from the first page and 1 for each of the other ones" do
      page_one_songs = [
        Mixtape::Song.new("Jamie xx","Gosh"),
        Mixtape::Song.new("Prurient","Dragonflies to Sew You Up"),
        Mixtape::Song.new("Jamie xx","Loud Places ft Romy"),
        Mixtape::Song.new("Galcher Lustwerk","Parlay"),
        Mixtape::Song.new("Ziq","XT")
      ]
      page_two_songs = [
        Mixtape::Song.new("Earl Sweatshirt","Grief"),
        Mixtape::Song.new("Kendrick Lamar","King Kunta"),
        Mixtape::Song.new("Death Grips","On GP"),
        Mixtape::Song.new("Lower Dens","Ondine"),
        Mixtape::Song.new("Sheer Mag","Button Up"),
      ]
      page_three_songs = [
        Mixtape::Song.new("Sufjan Stevens", "Should Have Known Better"),
        Mixtape::Song.new("Tame Impala", "Let It Happen"),
        Mixtape::Song.new("Grimes", "REALiTi"),
        Mixtape::Song.new("Soko", "Lovetrap ft Ariel Pink"),
        Mixtape::Song.new("Chromatics", "I Can Never Be Myself When Youre Around"),
      ]
      page_four_songs = [
        Mixtape::Song.new("Jenny Hval", "That Battle Is Over"),
        Mixtape::Song.new("Westkust", "Swirl"),
        Mixtape::Song.new("Tink", "Ratchet Commandments"),
        Mixtape::Song.new("Courtney Barnett", "Depreston"),
        Mixtape::Song.new("Sannhet", "Revisionist"),
      ]
      page_five_songs = [
        Mixtape::Song.new("Sufjan Stevens", "No Shade in the Shadow of the Cross"),
        Mixtape::Song.new("Drake", "Energy"),
        Mixtape::Song.new("Hot Chip", "Huarache Lights"),
        Mixtape::Song.new("Speedy Ortiz", "Raising the Skate"),
        Mixtape::Song.new("Kendrick Lamar", "The Blacker the Berry"),
      ]
      page_six_songs = [
        Mixtape::Song.new("Unknown Mortal Orchestra", "MultiLove"),
        Mixtape::Song.new("Makthaverskan", "Witness"),
        Mixtape::Song.new("Courtney Barnett", "Pedestrian at Best"),
        Mixtape::Song.new("Lower Dens", "To Die in LA"),
        Mixtape::Song.new("Jazmine Sullivan", "Dumb ft Meek Mill"),
      ]
      page_seven_songs = [
        Mixtape::Song.new("Frank Ocean", "At Your Best You Are Love Aaliyah/The Isley Brothers Cover"),
        Mixtape::Song.new("Charli XCX", "Doing It ft Rita Ora"),
        Mixtape::Song.new("Aphex Twin", "Diskhat ALL Prepared1mixed snr2mix"),
        Mixtape::Song.new("Tobias Jesso Jr", "How Could You Babe"),
        Mixtape::Song.new("Arca", "Sheep"),
      ]
      page_eight_songs = [
        Mixtape::Song.new("Natalie Prass", "My Baby Dont Understand Me"),
        Mixtape::Song.new("Waxahatchee", "Air"),
        Mixtape::Song.new("Twerps", "I Dont Mind"),
        Mixtape::Song.new("Miguel", "nwa ft Kurupt"),
        Mixtape::Song.new("Nicki Minaj", "Feeling Myself ft Beyonc")
      ]
      top_ten_tracks = Mixtape::Pitchfork.best_new_tracks

      intersection = top_ten_tracks[0..2] & page_one_songs
      intersection.wont_be_empty
      page_two_songs.must_include   top_ten_tracks[3]
      page_three_songs.must_include top_ten_tracks[4]
      page_four_songs.must_include  top_ten_tracks[5]
      page_five_songs.must_include  top_ten_tracks[6]
      page_six_songs.must_include   top_ten_tracks[7]
      page_seven_songs.must_include top_ten_tracks[8]
      page_eight_songs.must_include top_ten_tracks[9]
    end
  end
end
