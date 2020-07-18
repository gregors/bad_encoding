require 'test_helper'

class BadEncodingTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::BadEncoding::VERSION
  end

  def test_it_finds_bad_encoding
    bad_string = "r. \xED\xA0\xBD\xED\xB9\x82 )</p>\n</div>\n        </div>\n\n"
    assert(bad_string.show_bad_encoding == bad_string)
  end

  def test_show_msg_when_no_bad_encoding
    good_string = "hey you guys!"
    assert(good_string.show_bad_encoding == "no bad segments found")
  end
end
