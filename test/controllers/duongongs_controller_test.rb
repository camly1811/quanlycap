require "test_helper"

class DuongongsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @duongong = duongongs(:one)
  end

  test "should get index" do
    get duongongs_url
    assert_response :success
  end

  test "should get new" do
    get new_duongong_url
    assert_response :success
  end

  test "should create duongong" do
    assert_difference("Duongong.count") do
      post duongongs_url, params: { duongong: { be_cuoi_id: @duongong.be_cuoi_id, be_dau_id: @duongong.be_dau_id, don_vi_ql: @duongong.don_vi_ql, loai_ong: @duongong.loai_ong, mau_sac: @duongong.mau_sac, ten_ong: @duongong.ten_ong } }
    end

    assert_redirected_to duongong_url(Duongong.last)
  end

  test "should show duongong" do
    get duongong_url(@duongong)
    assert_response :success
  end

  test "should get edit" do
    get edit_duongong_url(@duongong)
    assert_response :success
  end

  test "should update duongong" do
    patch duongong_url(@duongong), params: { duongong: { be_cuoi_id: @duongong.be_cuoi_id, be_dau_id: @duongong.be_dau_id, don_vi_ql: @duongong.don_vi_ql, loai_ong: @duongong.loai_ong, mau_sac: @duongong.mau_sac, ten_ong: @duongong.ten_ong } }
    assert_redirected_to duongong_url(@duongong)
  end

  test "should destroy duongong" do
    assert_difference("Duongong.count", -1) do
      delete duongong_url(@duongong)
    end

    assert_redirected_to duongongs_url
  end
end
