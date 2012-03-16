require 'test_helper'

class ImagesControllerTest < ActionController::TestCase

  test 'serves files' do
    get :show, :resource => 'rails', :format => 'png'
    assert_response :success
    assert_match /app\/assets\/images\/rails\.png/, assigns(:image).to_s
  end

end
