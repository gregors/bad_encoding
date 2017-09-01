require "bad_encoding/version"

module BadEncoding
  class B
    def initialize(segment_size=100)
      @segment_size = segment_size
    end

    def search(s, &block)
      return 'no bad segments found' unless block.call(s)
      process(s, block)
    end

    def process(s, check)
      #    puts "size: #{s.size}"
      return s if s.size <= @segment_size

      count = s.size
      middle = count / 2
      end_of_list = count - middle

      first_half = s.slice(0, middle)
      return if check.call(first_half)
               process(first_half, check)
             else
               second_half = s.slice(middle, end_of_list)
               process(second_half, check)
             end
  end
end

require 'core_ext/string'
