require "application_system_test_case"

class TuyencapsTest < ApplicationSystemTestCase
  setup do
    @tuyencap = tuyencaps(:one)
  end

  test "visiting the index" do
    visit tuyencaps_url
    assert_selector "h1", text: "Tuyencaps"
  end

  test "should create tuyencap" do
    visit tuyencaps_url
    click_on "New tuyencap"

    fill_in "Diembatdau", with: @tuyencap.diembatdau
    fill_in "Diemketthuc", with: @tuyencap.diemketthuc
    fill_in "Dvquanly", with: @tuyencap.dvquanly
    fill_in "Phanloai", with: @tuyencap.phanloai
    fill_in "Ten tuyen", with: @tuyencap.ten_tuyen
    click_on "Create Tuyencap"

    assert_text "Tuyencap was successfully created"
    click_on "Back"
  end

  test "should update Tuyencap" do
    visit tuyencap_url(@tuyencap)
    click_on "Edit this tuyencap", match: :first

    fill_in "Diembatdau", with: @tuyencap.diembatdau
    fill_in "Diemketthuc", with: @tuyencap.diemketthuc
    fill_in "Dvquanly", with: @tuyencap.dvquanly
    fill_in "Phanloai", with: @tuyencap.phanloai
    fill_in "Ten tuyen", with: @tuyencap.ten_tuyen
    click_on "Update Tuyencap"

    assert_text "Tuyencap was successfully updated"
    click_on "Back"
  end

  test "should destroy Tuyencap" do
    visit tuyencap_url(@tuyencap)
    click_on "Destroy this tuyencap", match: :first

    assert_text "Tuyencap was successfully destroyed"
  end
end
