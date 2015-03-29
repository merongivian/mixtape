require 'test_helper'

describe Mixtape::Pitchfork do
  describe ".best_new_tracks" do
    it "returns a hash with 10 songs from new best tracks" do
      path = File.expand_path("../..", __FILE__) + '/fixtures/pitchfork/'

      file_first_page = open(path + 'best_new_tracks_1.html')
      file_second_page = open(path + 'best_new_tracks_2.html')

      Kernel.expects(:open).with("http://pitchfork.com/reviews/best/tracks/1/")
        .returns file_first_page
      Kernel.expects(:open).with("http://pitchfork.com/reviews/best/tracks/2/")
        .returns file_second_page

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
