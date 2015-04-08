module Mixtape
  module Source
    class Base
      class NotImplementedError < StandardError; end

      def initialize(number_of_songs)
        @number_of_songs = number_of_songs
        if pages_ids.length != number_of_songs
          raise(ArgumentError, 'Number of songs must equal the number of pages')
        end
      end

      def songs
        sliced_songs = pages_ids.pmap{ |id| songs_for_page_id(id) }
        random_songs = Mixtape::RandomSongs.new(sliced_songs)
        random_songs.pick_by(1)
      end

      def pages_ids
        (1..@number_of_songs).to_a
      end

      def songs_for_page_id(id)
        raise NotImplementedError
      end
    end
  end
end
