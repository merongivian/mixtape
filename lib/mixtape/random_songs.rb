module Mixtape
  class RandomSongs
    def initialize(sliced_songs)
      @sliced_songs = sliced_songs
    end

    def pick_by(number_per_section)
      @sliced_songs.map do |slice|
        slice.sample(number_per_section)
      end.flatten
    end
  end
end
