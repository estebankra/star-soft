require "application_system_test_case"

class QuotationsTest < ApplicationSystemTestCase
  setup do
    @quotation = quotations(:one)
  end

  test "visiting the index" do
    visit quotations_url
    assert_selector "h1", text: "Quotations"
  end

  test "creating a Quotation" do
    visit quotations_url
    click_on "New Quotation"

    fill_in "Currency id", with: @quotation.currency_id_id
    fill_in "Date", with: @quotation.date
    fill_in "Purchase", with: @quotation.purchase
    fill_in "Sale", with: @quotation.sale
    click_on "Create Quotation"

    assert_text "Quotation was successfully created"
    click_on "Back"
  end

  test "updating a Quotation" do
    visit quotations_url
    click_on "Edit", match: :first

    fill_in "Currency id", with: @quotation.currency_id_id
    fill_in "Date", with: @quotation.date
    fill_in "Purchase", with: @quotation.purchase
    fill_in "Sale", with: @quotation.sale
    click_on "Update Quotation"

    assert_text "Quotation was successfully updated"
    click_on "Back"
  end

  test "destroying a Quotation" do
    visit quotations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Quotation was successfully destroyed"
  end
end
