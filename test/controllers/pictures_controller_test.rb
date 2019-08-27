require 'test_helper'

class PicturesControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get pictures_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get pictures_destroy_url
    assert_response :success
  end

end
