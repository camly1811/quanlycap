class TuyencapsController < ApplicationController
  before_action :set_tuyencap, only: %i[show edit update destroy remove_connections]

  # GET /tuyencaps or /tuyencaps.json
  def index
    @tuyencaps = Tuyencap.all
    @bes = Be.all
    # @tuyencaps = Tuyencap.all.includes(:tuyencap_bes)
    respond_to do |format|
      format.html
      format.json { render json: @tuyencaps.as_json(include: { tuyencap_bes: { include: %i[be_id_dau be_id_cuoi] } }) }
    end
  end

  # GET /tuyencaps/1 or /tuyencaps/1.json
  def show; end

  # GET /tuyencaps/new
  def new
    @tuyencap = Tuyencap.new
  end

  # GET /tuyencaps/1/edit
  def edit; end

  # POST /tuyencaps or /tuyencaps.json
  # def create
  #   @tuyencap = Tuyencap.new(tuyencap_params)

  #   respond_to do |format|
  #     if @tuyencap.save
  #       format.html { redirect_to @tuyencap, notice: 'Tuyencap was successfully created.' }
  #       format.json { render :show, status: :created, location: @tuyencap }
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #       format.json { render json: @tuyencap.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def create
    @tuyencap = Tuyencap.new(tuyencap_params)

    if @tuyencap.save
      create_tuyencap_bes(params[:be_ids])
      redirect_to @tuyencap, notice: 'Tuyến cáp đã được tạo thành công.'
    else
      @bes = Be.all
      render :new
    end
  end

  # PATCH/PUT /tuyencaps/1 or /tuyencaps/1.json
  def update
    respond_to do |format|
      if @tuyencap.update(tuyencap_params)
        format.html { redirect_to @tuyencap, notice: 'Tuyencap was successfully updated.' }
        format.json { render :show, status: :ok, location: @tuyencap }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tuyencap.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tuyencaps/1 or /tuyencaps/1.json
  def destroy
    @tuyencap.destroy

    respond_to do |format|
      format.html { redirect_to tuyencaps_path, status: :see_other, notice: 'Tuyến cáp đã bị xóa thành công.' }
      format.json { head :no_content }
    end
  end

  # def create_from_map
  #   @tuyencap = Tuyencap.new(tuyencap_params)

  #   if @tuyencap.save
  #     be_ids = params[:be_ids].split(',')
  #     if be_ids.size >= 2
  #       be_ids.each_cons(2) do |be_id_dau, be_id_cuoi|
  #         TuyencapBe.create(tuyencap: @tuyencap, be_id_dau_id: be_id_dau, be_id_cuoi_id: be_id_cuoi)
  #       end
  #     end

  #     @tuyencap = Tuyencap.includes(tuyencap_bes: %i[be_id_dau be_id_cuoi]).find(@tuyencap.id)

  #     render json: {
  #       success: true,
  #       message: 'Tuyến cap đã được tạo thành công.',
  #       tuyencap: @tuyencap,
  #       tuyencap_id: @tuyencap.id
  #     }
  #   else
  #     render json: { success: false, message: @tuyencap.errors.full_messages }
  #   end
  # end

  def create_from_map
    @tuyencap = Tuyencap.new(tuyencap_params)

    if @tuyencap.save
      be_ids = params[:be_ids].split(',')
      if be_ids.size >= 2
        be_ids.each_cons(2) do |be_id_dau, be_id_cuoi|
          TuyencapBe.create(tuyencap: @tuyencap, be_id_dau_id: be_id_dau, be_id_cuoi_id: be_id_cuoi)
        end
      end

      @tuyencap = Tuyencap.includes(tuyencap_bes: %i[be_id_dau be_id_cuoi]).find(@tuyencap.id)

      render json: {
        success: true,
        message: 'Tuyến cap đã được tạo thành công.',
        tuyencap: @tuyencap.as_json(include: { tuyencap_bes: { include: %i[be_id_dau be_id_cuoi] } })
      }
    else
      render json: { success: false, message: @tuyencap.errors.full_messages }
    end
  end

  def add_connections
    @tuyencap = Tuyencap.find(params[:id])
    be_ids = params[:be_ids].split(',')
  
    if be_ids.size >= 2
      be_ids.each_cons(2) do |be_id_dau, be_id_cuoi|
        TuyencapBe.create(tuyencap: @tuyencap, be_id_dau_id: be_id_dau, be_id_cuoi_id: be_id_cuoi)
      end
      render json: { success: true, message: "Đã thêm đường nối thành công tại tuyến: #{@tuyencap.ten_tuyen}" }
    else
      render json: { success: false, message: 'Vui lòng chọn ít nhất hai BEs để thêm đường nối!' }
    end
  end

  def remove_connections
    be_ids = params[:be_ids].split(',')
    
    TuyencapBe.where(tuyencap: @tuyencap, be_id_dau_id: be_ids, be_id_cuoi_id: be_ids).destroy_all

    render json: {
      success: true,
      message: 'Đường nối đã được xóa thành công.',
      tuyencap: @tuyencap.as_json(include: { tuyencap_bes: { include: %i[be_id_dau be_id_cuoi] } })
    }
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tuyencap
    @tuyencap = Tuyencap.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def tuyencap_params
    params.permit(:ten_tuyen, :phanloai, :dvquanly, :diembatdau, :diemketthuc, be_ids: [])
  end
end
