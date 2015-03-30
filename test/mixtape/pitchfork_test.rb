require 'test_helper'

describe Mixtape::Pitchfork, :vcr do
  describe ".best_new_tracks" do
    it "returns a hash with 10 songs from new best tracks" do
      songs = [
        {
          artist: "Jamie xx",
          song: "Gosh"
        },
        {
          artist: "Prurient",
          song: "Dragonflies to Sew You Up"
        },
        {
          artist: "Jamie xx",
          song: "Loud Places ft Romy"
        },
        {
          artist: "Galcher Lustwerk",
          song: "Parlay"
        },
        {
          artist: "Ziq",
          song: "XT"
        },
        {
          artist: "Earl Sweatshirt",
          song: "Grief"
        },
        {
          artist: "Kendrick Lamar",
          song: "King Kunta"
        },
        {
          artist: "Death Grips",
          song: "On GP"
        },
        {
          artist: "Lower Dens",
          song: "Ondine"
        },
        {
          artist: "Sheer Mag",
          song: "Button Up"
        }
      ]
      Mixtape::Pitchfork.best_new_tracks.must_equal songs
    end
  end
end
