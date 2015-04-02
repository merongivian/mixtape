require 'test_helper'

describe Mixtape::Source::Pitchfork, :vcr do
  describe ".best_new_tracks" do
    let(:songs) do [
        Mixtape::Song.new("iLoveMakonnen", "Whip It Remix ft Migos and Rich the Kid"),
        Mixtape::Song.new("Cakes Da Killa", "Serve It Up"),
        Mixtape::Song.new("Jamie xx","Gosh"),
        Mixtape::Song.new("Prurient","Dragonflies to Sew You Up"),
        Mixtape::Song.new("Jamie xx","Loud Places ft Romy"),
        Mixtape::Song.new("Galcher Lustwerk","Parlay"),
        Mixtape::Song.new("Ziq","XT"),
        Mixtape::Song.new("Earl Sweatshirt","Grief"),
        Mixtape::Song.new("Kendrick Lamar","King Kunta"),
        Mixtape::Song.new("Death Grips","On GP"),
        Mixtape::Song.new("Lower Dens","Ondine"),
        Mixtape::Song.new("Sheer Mag","Button Up"),
        Mixtape::Song.new("Sufjan Stevens", "Should Have Known Better"),
        Mixtape::Song.new("Tame Impala", "Let It Happen"),
        Mixtape::Song.new("Grimes", "REALiTi"),
        Mixtape::Song.new("Soko", "Lovetrap ft Ariel Pink"),
        Mixtape::Song.new("Chromatics", "I Can Never Be Myself When Youre Around"),
        Mixtape::Song.new("Jenny Hval", "That Battle Is Over"),
        Mixtape::Song.new("Westkust", "Swirl"),
        Mixtape::Song.new("Tink", "Ratchet Commandments"),
        Mixtape::Song.new("Courtney Barnett", "Depreston"),
        Mixtape::Song.new("Sannhet", "Revisionist"),
        Mixtape::Song.new("Sufjan Stevens", "No Shade in the Shadow of the Cross"),
        Mixtape::Song.new("Drake", "Energy"),
        Mixtape::Song.new("Hot Chip", "Huarache Lights"),
        Mixtape::Song.new("Speedy Ortiz", "Raising the Skate"),
        Mixtape::Song.new("Kendrick Lamar", "The Blacker the Berry"),
        Mixtape::Song.new("Unknown Mortal Orchestra", "MultiLove"),
        Mixtape::Song.new("Makthaverskan", "Witness"),
        Mixtape::Song.new("Courtney Barnett", "Pedestrian at Best"),
        Mixtape::Song.new("Lower Dens", "To Die in LA"),
        Mixtape::Song.new("Jazmine Sullivan", "Dumb ft Meek Mill"),
        Mixtape::Song.new("Frank Ocean", "At Your Best You Are Love Aaliyah/The Isley Brothers Cover"),
        Mixtape::Song.new("Charli XCX", "Doing It ft Rita Ora"),
        Mixtape::Song.new("Aphex Twin", "Diskhat ALL Prepared1mixed snr2mix"),
        Mixtape::Song.new("Tobias Jesso Jr", "How Could You Babe"),
        Mixtape::Song.new("Arca", "Sheep"),
        Mixtape::Song.new("Natalie Prass", "My Baby Dont Understand Me"),
        Mixtape::Song.new("Waxahatchee", "Air"),
        Mixtape::Song.new("Twerps", "I Dont Mind"),
    ] end

    context "number of songs" do
      let(:top_ten_tracks) { Mixtape::Source::Pitchfork.best_new_tracks }

      it "returns 10 songs" do
        top_ten_tracks.length.must_equal 10
      end

      it "takes them from pitchfork's best new tracks" do
        intersection = top_ten_tracks & songs
        intersection.length.must_equal 10
      end
    end

    it 'picks them randomly with more recent ones' do
      Mixtape::RandomSongs.any_instance.expects(:most_recent_pick).once
      Mixtape::Source::Pitchfork.best_new_tracks
    end
  end
end
