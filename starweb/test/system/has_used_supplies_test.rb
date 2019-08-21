require "application_system_test_case"

class HasUsedSuppliesTest < ApplicationSystemTestCase
  setup do
    @has_used_supply = has_used_supplies(:one)
  end

  test "visiting the index" do
    visit has_used_supplies_url
    assert_selector "h1", text: "Has Used Supplies"
  end

  test "creating a Has used supply" do
    visit has_used_supplies_url
    click_on "New Has Used Supply"

    fill_in "Order", with: @has_used_supply.order_id
    fill_in "Quantity", with: @has_used_supply.quantity
    fill_in "Supply", with: @has_used_supply.supply_id
    click_on "Create Has used supply"

    assert_text "Has used supply was successfully created"
    click_on "Back"
  end

  test "updating a Has used supply" do
    visit has_used_supplies_url
    click_on "Edit", match: :first

    fill_in "Order", with: @has_used_supply.order_id
    fill_in "Quantity", with: @has_used_supply.quantity
    fill_in "Supply", with: @has_used_supply.supply_id
    click_on "Update Has used supply"

    assert_text "Has used supply was successfully updated"
    click_on "Back"
  end

  test "destroying a Has used supply" do
    visit has_used_supplies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Has used supply was successfully destroyed"
  end
end
