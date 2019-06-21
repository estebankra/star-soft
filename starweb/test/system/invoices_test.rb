require "application_system_test_case"

class InvoicesTest < ApplicationSystemTestCase
  setup do
    @invoice = invoices(:one)
  end

  test "visiting the index" do
    visit invoices_url
    assert_selector "h1", text: "Invoices"
  end

  test "creating a Invoice" do
    visit invoices_url
    click_on "New Invoice"

    check "Counted credit" if @invoice.counted_credit
    fill_in "Date", with: @invoice.date
    fill_in "Iva10", with: @invoice.iva10
    fill_in "Iva5", with: @invoice.iva5
    fill_in "Order", with: @invoice.order_id
    fill_in "Total", with: @invoice.total
    click_on "Create Invoice"

    assert_text "Invoice was successfully created"
    click_on "Back"
  end

  test "updating a Invoice" do
    visit invoices_url
    click_on "Edit", match: :first

    check "Counted credit" if @invoice.counted_credit
    fill_in "Date", with: @invoice.date
    fill_in "Iva10", with: @invoice.iva10
    fill_in "Iva5", with: @invoice.iva5
    fill_in "Order", with: @invoice.order_id
    fill_in "Total", with: @invoice.total
    click_on "Update Invoice"

    assert_text "Invoice was successfully updated"
    click_on "Back"
  end

  test "destroying a Invoice" do
    visit invoices_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Invoice was successfully destroyed"
  end
end
