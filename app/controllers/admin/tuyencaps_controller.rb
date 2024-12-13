module Admin
  class TuyencapsController < ApplicationController
    def index
      # Group thông tin dữ liệu theo `ten_tuyen`
      @grouped_tuyencap_bes = TuyencapBe.includes(:tuyencap, :be_id_dau, :be_id_cuoi)
                                         .all.group_by { |tc| tc.tuyencap.ten_tuyen }
      # Tính tổng số tuyến cáp
      @total_routes = @grouped_tuyencap_bes.keys.count
    end
  end
end
