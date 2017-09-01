class String
  def show_bad_encoding
    BadEncoding::B.new.search(self) do |segment|
      segment.valid_encoding? == false
    end
  end
end
