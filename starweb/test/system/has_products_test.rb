require "application_system_test_case"

class HasProductsTest < ApplicationSystemTestCase
  setup do
    @has_product = has_products(:one)
  end

  test "visiting the index" do
    visit has_products_url
    assert_selector "h1", text: "Has Products"
  end

  test "creating a Has product" do
    visit has_products_url
    click_on "New Has Product"

    fill_in "Color", with: @has_product.color
    fill_in "Design", with: @has_product.design
    fill_in "Order", with: @has_product.order_id
    fill_in "Product", with: @has_product.product_id
    fill_in "Quantity", with: @has_product.quantity
    fill_in "Specs b", with: @has_product.specs_b
    fill_in "Specs f", with: @has_product.specs_f
    click_on "Create Has product"

    assert_text "Has product was successfully created"
    click_on "Back"
  end

  test "updating a Has product" do
    visit has_products_url
    click_on "Edit", match: :first

    fill_in "Color", with: @has_product.color
    fill_in "Design", with: @has_product.design
    fill_in "Order", with: @has_product.order_id
    fill_in "Product", with: @has_product.product_id
    fill_in "Quantity", with: @has_product.quantity
    fill_in "Specs b", with: @has_product.specs_b
    fill_in "Specs f", with: @has_product.specs_f
    click_on "Update Has product"

    assert_text "Has product was successfully updated"
    click_on "Back"
  end

  test "destroying a Has product" do
    visit has_products_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Has product was successfully destroyed"
  end
end
