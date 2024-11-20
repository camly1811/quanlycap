class DuongongsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_duongong, only: %i[show edit update destroy destroy_route]

  # GET /duongongs or /duongongs.json
  def index
    @duongongs = Duongong.all
    @bes = Be.all
  end

  # GET /duongongs/1 or /duongongs/1.json
  def show; end

  # GET /duongongs/new
  def new
    @duongong = Duongong.new
  end

  # GET /duongongs/1/edit
  def edit; end

  # POST /duongongs or /duongongs.json
  def create
    @duongong = Duongong.new(duongong_params)

    respond_to do |format|
      if @duongong.save
        format.html { redirect_to duongongs_path, notice: 'Duongong was successfully created.' }
        format.json { render :show, status: :created, location: @duongong }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @duongong.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /duongongs/1 or /duongongs/1.json
  def update
    respond_to do |format|
      if @duongong.update(duongong_params)
        format.html { redirect_to duongongs_path, notice: 'Duongong was successfully updated.' }
        format.json { render :show, status: :ok, location: @duongong }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @duongong.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /duongongs/1 or /duongongs/1.json
  def destroy
    @duongong.destroy

    respond_to do |format|
      format.html { redirect_to duongongs_path, notice: 'Duongong was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def routes
    @routes = Duongong.includes(:be_dau, :be_cuoi).all
    render json: @routes.to_json(include: {
                                   be_dau: { only: %i[latitude longitude tenbe address loaibe
                                                      coquan] }, be_cuoi: { only: %i[latitude longitude tenbe address loaibe coquan] }
                                 })
  end

  def destroy_route
    @duongong = Duongong.find(params[:id])
    if @duongong.destroy
      render json: { message: 'Đường ống đã được xóa thành công' }, status: :ok
    else
      render json: { error: 'Không thể xóa đường ống' }, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_duongong
    @duongong = Duongong.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def duongong_params
    params.require(:duongong).permit(:ten_ong, :loai_ong, :be_dau_id, :be_cuoi_id, :mau_sac, :don_vi_ql)
  end
end
