require "bad_encoding/version"

module BadEncoding
  class B
    def initialize(segment_size=100)
      @segment_size = segment_size
    end

    def search(s, &block)
      process(s, block)
    end

    def process(s, check)
      #    puts "size: #{s.size}"
      return s if s.size <= @segment_size

      count = s.size
      middle = count / 2
      end_of_list = count - middle

      first_half = s.slice(0, middle)
      if check.call(first_half)
        return process(first_half, check)
      end

      second_half = s.slice(middle, end_of_list)
      if check.call(second_half)
        return process(second_half, check)
      end

      return 'no bad segments founds'
    end
  end
end

require 'core_ext/string'
