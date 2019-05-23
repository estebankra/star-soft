require "application_system_test_case"

class InfoDetailsTest < ApplicationSystemTestCase
  setup do
    @info_detail = info_details(:one)
  end

  test "visiting the index" do
    visit info_details_url
    assert_selector "h1", text: "Info Details"
  end

  test "creating a Info detail" do
    visit info_details_url
    click_on "New Info Detail"

    fill_in "Firstname", with: @info_detail.firstname
    fill_in "Lastname", with: @info_detail.lastname
    fill_in "Number", with: @info_detail.number
    fill_in "Size", with: @info_detail.size
    click_on "Create Info detail"

    assert_text "Info detail was successfully created"
    click_on "Back"
  end

  test "updating a Info detail" do
    visit info_details_url
    click_on "Edit", match: :first

    fill_in "Firstname", with: @info_detail.firstname
    fill_in "Lastname", with: @info_detail.lastname
    fill_in "Number", with: @info_detail.number
    fill_in "Size", with: @info_detail.size
    click_on "Update Info detail"

    assert_text "Info detail was successfully updated"
    click_on "Back"
  end

  test "destroying a Info detail" do
    visit info_details_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Info detail was successfully destroyed"
  end
end
