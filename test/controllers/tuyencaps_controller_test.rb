require "test_helper"

class TuyencapsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tuyencap = tuyencaps(:one)
  end

  test "should get index" do
    get tuyencaps_url
    assert_response :success
  end

  test "should get new" do
    get new_tuyencap_url
    assert_response :success
  end

  test "should create tuyencap" do
    assert_difference("Tuyencap.count") do
      post tuyencaps_url, params: { tuyencap: { diembatdau: @tuyencap.diembatdau, diemketthuc: @tuyencap.diemketthuc, dvquanly: @tuyencap.dvquanly, phanloai: @tuyencap.phanloai, ten_tuyen: @tuyencap.ten_tuyen } }
    end

    assert_redirected_to tuyencap_url(Tuyencap.last)
  end

  test "should show tuyencap" do
    get tuyencap_url(@tuyencap)
    assert_response :success
  end

  test "should get edit" do
    get edit_tuyencap_url(@tuyencap)
    assert_response :success
  end

  test "should update tuyencap" do
    patch tuyencap_url(@tuyencap), params: { tuyencap: { diembatdau: @tuyencap.diembatdau, diemketthuc: @tuyencap.diemketthuc, dvquanly: @tuyencap.dvquanly, phanloai: @tuyencap.phanloai, ten_tuyen: @tuyencap.ten_tuyen } }
    assert_redirected_to tuyencap_url(@tuyencap)
  end

  test "should destroy tuyencap" do
    assert_difference("Tuyencap.count", -1) do
      delete tuyencap_url(@tuyencap)
    end

    assert_redirected_to tuyencaps_url
  end
end
