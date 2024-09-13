class TuyencapsController < ApplicationController
  before_action :set_tuyencap, only: %i[show edit update destroy add_bes]

  # GET /tuyencaps or /tuyencaps.json
  def index
    # @tuyencaps = Tuyencap.all
    # @tuyencaps = Tuyencap.includes(duongongs: %i[be_dau be_cuoi]).all
    # @tuyencaps = Tuyencap.includes(:bes, :duongongs).all
    @tuyencaps = Tuyencap.all
    @bes = Be.all # Load all bes for potential display on the map
    # @duongongs = DuongOng.all # Load all duongongs for potential display on the map
    # @tuyen_cap_be_data = TuyencapBe.joins(:tuyencap).select('tuyencaps.ten_tuyen, tuyencap_bes.be_id, bes.longitude, bes.latitude').joins('INNER JOIN bes ON tuyencap_bes.be_id = bes.id').group_by(&:ten_tuyen)
    # render json: {
    #   tuyencaps: @tuyencaps.map do |tuyencap|
    #     {
    #       id: tuyencap.id,
    #       bes: tuyencap.bes.map do |be|
    #         { id: be.id, longitude: be.longitude, latitude: be.latitude }
    #       end
    #     }
    #   end
    # }
    respond_to do |format|
      format.html
      format.json { render json: @tuyencaps.as_json(include: :bes) }
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
  def create
    @tuyencap = Tuyencap.new(tuyencap_params)

    return unless @tuyencap.save

    redirect_to tuyencaps_path, notice: 'Tuyencap was successfully created.'
    # else
    #   render :new
  end

  # PATCH/PUT /tuyencaps/1 or /tuyencaps/1.json
  def update
    respond_to do |format|
      if @tuyencap.update(tuyencap_params)
        format.html { redirect_to tuyencap_url(@tuyencap), notice: 'Tuyencap was successfully updated.' }
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
    TuyencapBe.where(tuyencap_id: @tuyencap.id).destroy_all

    respond_to do |format|
      format.html { redirect_to tuyencaps_url, notice: 'Tuyencap was successfully destroyed.' }
      format.json { render json: { success: true, message: 'Tuyencap was successfully deleted.' } }
    end
  end

  def create_from_map
    @tuyencap = Tuyencap.new(tuyencap_params)

    if @tuyencap.save
      be_ids = params[:be_ids].split(',').map(&:to_i)
      be_ids.each do |be_id|
        TuyencapBe.create(tuyencap: @tuyencap, be_id:)
      end

      @tuyencap = Tuyencap.includes(:bes).find(@tuyencap.id)

      bes_with_coords = @tuyencap.bes.map do |be|
        { id: be.id, longitude: be.longitude, latitude: be.latitude }
      end

      render json: {
        success: true,
        message: 'Tuyến cap đã được tạo thành công.',
        tuyencap: @tuyencap,
        bes: bes_with_coords,
        tuyencap_id: @tuyencap.id
      }
    else
      render json: { success: false, message: @tuyencap.errors.full_messages }
    end
  end

  def add_bes
    be_ids = params[:be_ids].split(',').map(&:to_i)

    be_ids.each do |be_id|
      # Check if the Be is already associated to avoid duplicates
      @tuyencap.bes << Be.find(be_id) unless @tuyencap.bes.exists?(be_id)
    end

    if @tuyencap.save
      render json: {
        success: true,
        message: 'Tuyến Cáp đã được cập nhật thành công với bes bổ sung.',
        tuyencap: @tuyencap
      }
    else
      render json: { success: false, message: @tuyencap.errors.full_messages }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tuyencap
    @tuyencap = Tuyencap.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def tuyencap_params
    # params.require(:tuyencap).permit(:ten_tuyen, be_ids: [])
    # params.permit!
    params.permit(:ten_tuyen, :phanloai, :dvquanly, :diembatdau, :diemketthuc, be_ids: [])
  end
end
