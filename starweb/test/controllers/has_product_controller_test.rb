require 'test_helper'

class HasProductControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get has_product_index_url
    assert_response :success
  end

  test "should get new" do
    get has_product_new_url
    assert_response :success
  end

  test "should get create" do
    get has_product_create_url
    assert_response :success
  end

  test "should get update" do
    get has_product_update_url
    assert_response :success
  end

  test "should get destroy" do
    get has_product_destroy_url
    assert_response :success
  end

end
