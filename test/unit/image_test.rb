require 'test_helper'

class ImageTest < ActiveSupport::TestCase

  test 'root' do
    assert_kind_of Pathname, Image.root
    assert_match /app\/assets\/images$/, Image.root.to_s
  end

end
