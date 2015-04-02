module Mixtape
  class RandomSongs
    class UnbalancedArrayError < StandardError; end

    def initialize(sliced_songs)
      raise UnbalancedArrayError if sliced_songs.any? do |slice|
        slice.length != sliced_songs.first.length
      end
      @sliced_songs = sliced_songs
    end

    def pick_by(number_per_section)
      random_pick(@sliced_songs, number_per_section)
    end

    def most_recent_pick(first_section_number, by:)
      head, *tail = @sliced_songs
      first_section_pick = head.sample(first_section_number)
      first_section_pick + random_pick(tail, by)
    end

    private

    def random_pick(sliced_array, number_per_subarray)
      sliced_array.map do |slice|
        slice.sample(number_per_subarray)
      end.flatten
    end
  end
end
