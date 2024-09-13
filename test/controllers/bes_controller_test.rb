require "test_helper"

class BesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @be = bes(:one)
  end

  test "should get index" do
    get bes_url
    assert_response :success
  end

  test "should get new" do
    get new_be_url
    assert_response :success
  end

  test "should create be" do
    assert_difference("Be.count") do
      post bes_url, params: { be: { address: @be.address, coquan: @be.coquan, latitude: @be.latitude, loaibe: @be.loaibe, longitude: @be.longitude, tenbe: @be.tenbe } }
    end

    assert_redirected_to be_url(Be.last)
  end

  test "should show be" do
    get be_url(@be)
    assert_response :success
  end

  test "should get edit" do
    get edit_be_url(@be)
    assert_response :success
  end

  test "should update be" do
    patch be_url(@be), params: { be: { address: @be.address, coquan: @be.coquan, latitude: @be.latitude, loaibe: @be.loaibe, longitude: @be.longitude, tenbe: @be.tenbe } }
    assert_redirected_to be_url(@be)
  end

  test "should destroy be" do
    assert_difference("Be.count", -1) do
      delete be_url(@be)
    end

    assert_redirected_to bes_url
  end
end
