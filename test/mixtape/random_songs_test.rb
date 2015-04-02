require 'test_helper'

describe Mixtape::RandomSongs do
  let(:first_page_songs) do [
    Mixtape::Song.new("Cakes Da Killa", "Serve It Up"),
    Mixtape::Song.new("Jamie xx","Gosh"),
    Mixtape::Song.new("Prurient","Dragonflies to Sew You Up"),
    Mixtape::Song.new("Jamie xx","Loud Places ft Romy"),
    Mixtape::Song.new("Galcher Lustwerk","Parlay"),
  ] end

  let(:second_page_songs) do [
    Mixtape::Song.new("Ziq","XT"),
    Mixtape::Song.new("Earl Sweatshirt","Grief"),
    Mixtape::Song.new("Kendrick Lamar","King Kunta"),
    Mixtape::Song.new("Death Grips","On GP"),
    Mixtape::Song.new("Lower Dens","Ondine"),
  ] end

  let(:third_page_songs) do [
    Mixtape::Song.new("Radiohed","fake plastic trees"),
    Mixtape::Song.new("The Beatles","Julis"),
    Mixtape::Song.new("The cardigans","My favorite game"),
    Mixtape::Song.new("The Rolling Stones","Paint in Black"),
    Mixtape::Song.new("The verve","Lucky Man"),
  ] end

  let(:random_songs) do
    sliced_songs = [first_page_songs, second_page_songs, third_page_songs]
    Mixtape::RandomSongs.new(sliced_songs)
  end

  describe "#initialize" do
    it "raises an error if the subarrays don't have equal length" do
      unbalanced_array = [
        first_page_songs, second_page_songs,
        third_page_songs, [Mixtape::Song.new('cafe tacuba', 'ingrata')]
      ]
      -> { Mixtape::RandomSongs.new(unbalanced_array)}
        .must_raise Mixtape::RandomSongs::UnbalancedArrayError
    end
  end

  describe "#pick_by" do
    let(:picked_songs) { random_songs.pick_by 2 }

    it "picks 6 songs from the entire list" do
      picked_songs.length.must_equal 6
    end

    it "picks 2 songs from the first section" do
      intersection = picked_songs & first_page_songs
      intersection.length.must_equal 2
    end

    it "picks 2 songs from the second section" do
      intersection = picked_songs & second_page_songs
      intersection.length.must_equal 2
    end

    it "picks 2 songs from the third section" do
      intersection = picked_songs & third_page_songs
      intersection.length.must_equal 2
    end
  end

  describe "#most_recent_pick" do
    let(:picked_songs) { random_songs.most_recent_pick(3, by: 2) }

    it "picks 7 songs from the entire list" do
      picked_songs.length.must_equal 7
    end

    it "chooses 3 songs from the first section" do
      intersection = picked_songs & first_page_songs
      intersection.length.must_equal 3
    end

    it "chooses 2 songs from the second section" do
      intersection = picked_songs & second_page_songs
      intersection.length.must_equal 2
    end

    it "chooses 2 songs from the third section" do
      intersection = picked_songs & third_page_songs
      intersection.length.must_equal 2
    end
  end
end
