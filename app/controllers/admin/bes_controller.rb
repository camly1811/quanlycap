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
    
    def chart
      @bes = Be.all
      @data = @bes.group(:loaibe).count
      @total = @data.values.sum
      @percent_data = @data.transform_values { |v| (v.to_f / @total * 100).round(2) }
      @donvql = @bes.group(:coquan).count
      @tong = @donvql.values.sum
      @donvql_tong = @donvql.transform_values { |v| (v.to_f / @tong * 100).round(2) }
    end
  end
end