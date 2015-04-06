require 'test_helper'

describe Mixtape::Source::Base do
  describe "#pages_ids" do
    it "returns an array of consecutive numbers if not implemented" do
      class FirstSource < Mixtape::Source::Base; end
      pages_ids = FirstSource.new(3).pages_ids

      pages_ids.must_equal [1, 2, 3]
    end

    it "raises an error if number of songs is not equal to number of pages" do
      class SecondSource < Mixtape::Source::Base
        def pages_ids
          [1, 2]
        end
      end

      error = ->{ SecondSource.new(3) }.must_raise ArgumentError
      error.message.must_equal 'Number of songs must equal the number of pages'
    end
  end

  describe "#tracks_for_page_id" do
    it "raises an error if not implemented" do
      class ThirdSource < Mixtape::Source::Base; end
      third_source = ThirdSource.new(3)
      ->{ third_source.songs_for_page_id(0) }
        .must_raise Mixtape::Source::Base::NotImplementedError
    end
  end
end
