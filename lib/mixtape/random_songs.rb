module Mixtape
  class RandomSongs
    def initialize(sliced_songs)
      @sliced_songs = sliced_songs
    end

    def pick_by(number_per_section)
      @sliced_songs.flat_map do |slice|
        slice.sample(number_per_section)
      end
    end
  end
end
