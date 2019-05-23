require 'test_helper'

class InfoDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @info_detail = info_details(:one)
  end

  test "should get index" do
    get info_details_url
    assert_response :success
  end

  test "should get new" do
    get new_info_detail_url
    assert_response :success
  end

  test "should create info_detail" do
    assert_difference('InfoDetail.count') do
      post info_details_url, params: { info_detail: { firstname: @info_detail.firstname, lastname: @info_detail.lastname, number: @info_detail.number, size: @info_detail.size } }
    end

    assert_redirected_to info_detail_url(InfoDetail.last)
  end

  test "should show info_detail" do
    get info_detail_url(@info_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_info_detail_url(@info_detail)
    assert_response :success
  end

  test "should update info_detail" do
    patch info_detail_url(@info_detail), params: { info_detail: { firstname: @info_detail.firstname, lastname: @info_detail.lastname, number: @info_detail.number, size: @info_detail.size } }
    assert_redirected_to info_detail_url(@info_detail)
  end

  test "should destroy info_detail" do
    assert_difference('InfoDetail.count', -1) do
      delete info_detail_url(@info_detail)
    end

    assert_redirected_to info_details_url
  end
end
