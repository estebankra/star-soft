require "application_system_test_case"

class SponsorsTest < ApplicationSystemTestCase
  setup do
    @sponsor = sponsors(:one)
  end

  test "visiting the index" do
    visit sponsors_url
    assert_selector "h1", text: "Sponsors"
  end

  test "creating a Sponsor" do
    visit sponsors_url
    click_on "New Sponsor"

    fill_in "Image", with: @sponsor.image
    fill_in "Name", with: @sponsor.name
    click_on "Create Sponsor"

    assert_text "Sponsor was successfully created"
    click_on "Back"
  end

  test "updating a Sponsor" do
    visit sponsors_url
    click_on "Edit", match: :first

    fill_in "Image", with: @sponsor.image
    fill_in "Name", with: @sponsor.name
    click_on "Update Sponsor"

    assert_text "Sponsor was successfully updated"
    click_on "Back"
  end

  test "destroying a Sponsor" do
    visit sponsors_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sponsor was successfully destroyed"
  end
end
