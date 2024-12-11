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
  end
end