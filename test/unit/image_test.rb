require 'test_helper'

class ImageTest < ActiveSupport::TestCase

  test 'root' do
    assert_kind_of Pathname, Image.root
    assert_match /app\/assets\/images$/, Image.root.to_s
  end

  test 'exist?' do
    assert Image.exist?('owl')
    assert Image.exist?('owl', 'gif')
    assert Image.exist?('owl', 'png')
    assert Image.exist?('owl', 'png', 0)
    assert Image.exist?('owl', 'png', 1)
    assert Image.exist?('owl', 'png', 2)
    assert Image.exist?('owl', 'png', 3)
    assert !Image.exist?('owl', 'png', 4)
    assert !Image.exist?('owl', 'jpg')
  end

  test 'exists?' do
    assert Image.exists?('owl')
    assert Image.exists?('owl', 'gif')
    assert Image.exists?('owl', 'png')
    assert Image.exists?('owl', 'png', 0)
    assert Image.exists?('owl', 'png', 1)
    assert Image.exists?('owl', 'png', 2)
    assert Image.exists?('owl', 'png', 3)
    assert !Image.exists?('owl', 'png', 4)
    assert !Image.exists?('owl', 'jpg')
  end

  test 'first' do
    assert_kind_of String, Image.first('owl')
    assert_not_nil Image.first('owl')
    assert_not_nil Image.first('owl', 'gif')
    assert_not_nil Image.first('owl', 'png')
    assert_not_nil Image.first('owl', 'png', 0)
    assert_not_nil Image.first('owl', 'png', 1)
    assert_not_nil Image.first('owl', 'png', 2)
    assert_not_nil Image.first('owl', 'png', 3)
    assert_nil Image.first('owl', 'png', 4)
    assert_nil Image.first('owl', 'jpg')
  end

  test 'all' do
    assert_kind_of String, Image.all('owl').first
    assert_equal 5, Image.all('owl').count
    assert_equal 1, Image.all('owl', 'gif').count
    assert_equal 4, Image.all('owl', 'png').count
    assert_equal 1, Image.all('owl', 'png', 0).count
    assert_equal 1, Image.all('owl', 'png', 1).count
    assert_equal 1, Image.all('owl', 'png', 2).count
    assert_equal 1, Image.all('owl', 'png', 3).count
    assert_equal 0, Image.all('owl', 'png', 4).count
    assert_equal [], Image.all('owl', 'jpg')
  end

end
