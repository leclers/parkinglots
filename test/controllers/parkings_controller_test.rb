require 'test_helper'

class ParkingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get parkings_index_url
    assert_response :success
  end

  test "should get show" do
    get parkings_show_url
    assert_response :success
  end

  test "should get new" do
    get parkings_new_url
    assert_response :success
  end

  test "should get create" do
    get parkings_create_url
    assert_response :success
  end

  test "should get update" do
    get parkings_update_url
    assert_response :success
  end

  test "should get edit" do
    get parkings_edit_url
    assert_response :success
  end

end
