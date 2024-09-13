require "application_system_test_case"

class DuongongsTest < ApplicationSystemTestCase
  setup do
    @duongong = duongongs(:one)
  end

  test "visiting the index" do
    visit duongongs_url
    assert_selector "h1", text: "Duongongs"
  end

  test "should create duongong" do
    visit duongongs_url
    click_on "New duongong"

    fill_in "Be cuoi", with: @duongong.be_cuoi_id
    fill_in "Be dau", with: @duongong.be_dau_id
    fill_in "Don vi ql", with: @duongong.don_vi_ql
    fill_in "Loai ong", with: @duongong.loai_ong
    fill_in "Mau sac", with: @duongong.mau_sac
    fill_in "Ten ong", with: @duongong.ten_ong
    click_on "Create Duongong"

    assert_text "Duongong was successfully created"
    click_on "Back"
  end

  test "should update Duongong" do
    visit duongong_url(@duongong)
    click_on "Edit this duongong", match: :first

    fill_in "Be cuoi", with: @duongong.be_cuoi_id
    fill_in "Be dau", with: @duongong.be_dau_id
    fill_in "Don vi ql", with: @duongong.don_vi_ql
    fill_in "Loai ong", with: @duongong.loai_ong
    fill_in "Mau sac", with: @duongong.mau_sac
    fill_in "Ten ong", with: @duongong.ten_ong
    click_on "Update Duongong"

    assert_text "Duongong was successfully updated"
    click_on "Back"
  end

  test "should destroy Duongong" do
    visit duongong_url(@duongong)
    click_on "Destroy this duongong", match: :first

    assert_text "Duongong was successfully destroyed"
  end
end
