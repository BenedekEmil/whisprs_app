require "application_system_test_case"

class WhisprsTest < ApplicationSystemTestCase
  setup do
    @whispr = whisprs(:one)
  end

  test "visiting the index" do
    visit whisprs_url
    assert_selector "h1", text: "Whisprs"
  end

  test "creating a Whispr" do
    visit whisprs_url
    click_on "New Whispr"

    fill_in "Description", with: @whispr.description
    fill_in "Title", with: @whispr.title
    fill_in "User", with: @whispr.user_id
    click_on "Create Whispr"

    assert_text "Whispr was successfully created"
    click_on "Back"
  end

  test "updating a Whispr" do
    visit whisprs_url
    click_on "Edit", match: :first

    fill_in "Description", with: @whispr.description
    fill_in "Title", with: @whispr.title
    fill_in "User", with: @whispr.user_id
    click_on "Update Whispr"

    assert_text "Whispr was successfully updated"
    click_on "Back"
  end

  test "destroying a Whispr" do
    visit whisprs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Whispr was successfully destroyed"
  end
end
