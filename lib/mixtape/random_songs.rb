module Mixtape
  class RandomSongs
    def initialize(sliced_songs)
      @sliced_songs = sliced_songs
    end

    def pick_by(number_per_section)
      random_pick(@sliced_songs, number_per_section)
    end

    private

    def random_pick(sliced_array, number_per_subarray)
      sliced_array.map do |slice|
        slice.sample(number_per_subarray)
      end.flatten
    end
  end
end
