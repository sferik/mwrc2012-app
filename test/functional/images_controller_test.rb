require 'test_helper'

class ImagesControllerTest < ActionController::TestCase

  test 'serves files that exist' do
    assert File.exists?(Image.root.join('donkey.jpg'))
    get :show, :resource => 'donkey', :format => 'jpg'
    assert_response :success
    assert_match /app\/assets\/images\/donkey\.jpg/, assigns(:image).to_s
  end

  test 'serve static frames from animated GIFs' do
    get :show, :resource => 'owl', :format => 'png', :frame => '3'
    assert_response :success
    assert_match /app\/assets\/images\/owl\/3\.png/, assigns(:image).to_s
  end

  test 'raise a routing error for resources that don\'t exist' do
    assert_raise(ActionController::RoutingError) do
      get :show, :resource => 'not_found', :format => 'jpg'
    end
  end

  test 'raise a routing error for frames that don\'t exist' do
    assert_raise(ActionController::RoutingError) do
      get :show, :resource => 'owl', :format => 'png', :frame => '4'
    end
  end

end
