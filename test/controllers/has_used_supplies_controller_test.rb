require 'test_helper'

class HasUsedSuppliesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @has_used_supply = has_used_supplies(:one)
  end

  test "should get index" do
    get has_used_supplies_url
    assert_response :success
  end

  test "should get new" do
    get new_has_used_supply_url
    assert_response :success
  end

  test "should create has_used_supply" do
    assert_difference('HasUsedSupply.count') do
      post has_used_supplies_url, params: { has_used_supply: { order_id: @has_used_supply.order_id, quantity: @has_used_supply.quantity, supply_id: @has_used_supply.supply_id } }
    end

    assert_redirected_to has_used_supply_url(HasUsedSupply.last)
  end

  test "should show has_used_supply" do
    get has_used_supply_url(@has_used_supply)
    assert_response :success
  end

  test "should get edit" do
    get edit_has_used_supply_url(@has_used_supply)
    assert_response :success
  end

  test "should update has_used_supply" do
    patch has_used_supply_url(@has_used_supply), params: { has_used_supply: { order_id: @has_used_supply.order_id, quantity: @has_used_supply.quantity, supply_id: @has_used_supply.supply_id } }
    assert_redirected_to has_used_supply_url(@has_used_supply)
  end

  test "should destroy has_used_supply" do
    assert_difference('HasUsedSupply.count', -1) do
      delete has_used_supply_url(@has_used_supply)
    end

    assert_redirected_to has_used_supplies_url
  end
end
