module Admin
  class BesController < ApplicationController
    def index
      @bes = Be.all
    end
    
    def filter_by_loaibe
      # Lọc bể cáp theo loại bể (loaibe)
      @bes = Be.where(loaibe: params[:loaibe])
      render :index
    end

    # Action để hiển thị form chỉnh sửa thông tin bể cáp
    def edit
      @be = Be.find(params[:id])
    end

    # Action để cập nhật thông tin bể cáp sau khi chỉnh sửa
    def update
      @be = Be.find(params[:id])
      if @be.update(be_params)
        redirect_to admin_bes_path, notice: 'Thông tin bể cáp đã được cập nhật thành công.'
      else
        render :edit
      end
    end

    private

    # Dùng strong parameters để bảo mật dữ liệu
    def be_params
      params.require(:be).permit(:address, :tenbe, :loaibe, :coquan, :latitude, :longitude)
    end
  end
end