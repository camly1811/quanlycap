require "application_system_test_case"

class BesTest < ApplicationSystemTestCase
  setup do
    @be = bes(:one)
  end

  test "visiting the index" do
    visit bes_url
    assert_selector "h1", text: "Bes"
  end

  test "should create be" do
    visit bes_url
    click_on "New be"

    fill_in "Address", with: @be.address
    fill_in "Coquan", with: @be.coquan
    fill_in "Latitude", with: @be.latitude
    fill_in "Loaibe", with: @be.loaibe
    fill_in "Longitude", with: @be.longitude
    fill_in "Tenbe", with: @be.tenbe
    click_on "Create Be"

    assert_text "Be was successfully created"
    click_on "Back"
  end

  test "should update Be" do
    visit be_url(@be)
    click_on "Edit this be", match: :first

    fill_in "Address", with: @be.address
    fill_in "Coquan", with: @be.coquan
    fill_in "Latitude", with: @be.latitude
    fill_in "Loaibe", with: @be.loaibe
    fill_in "Longitude", with: @be.longitude
    fill_in "Tenbe", with: @be.tenbe
    click_on "Update Be"

    assert_text "Be was successfully updated"
    click_on "Back"
  end

  test "should destroy Be" do
    visit be_url(@be)
    click_on "Destroy this be", match: :first

    assert_text "Be was successfully destroyed"
  end
end
