class BesController < ApplicationController
  before_action :set_be, only: %i[show edit update destroy]

  # GET /bes or /bes.json
  def index
    @bes = Be.all
  end

  # GET /bes/1 or /bes/1.json
  def show; end

  # GET /bes/new
  def new
    @be = Be.new
  end

  # GET /bes/1/edit
  def edit; end

  # POST /bes or /bes.json
  def create
    @be = Be.new(be_params)

    respond_to do |format|
      if @be.save
        format.html { redirect_to bes_path, notice: 'Be was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bes/1 or /bes/1.json
  def update
    respond_to do |format|
      if @be.update(be_params)
        format.html { redirect_to bes_path, notice: 'Thông tin bể đã được cập nhật thành công.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bes/1 or /bes/1.json
  def destroy
    @be.destroy

    respond_to do |format|
      if @be.destroyed?
        format.html { redirect_to bes_path, notice: 'Be was successfully deleted.' }
        format.json { render json: { message: 'Be deleted successfully' }, status: :ok }
      else
        format.html { redirect_to bes_path, alert: 'Failed to delete Be.' }
        format.json { render json: { message: 'Failed to delete Be' }, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_be
    @be = Be.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def be_params
    params.require(:be).permit(:address, :tenbe, :loaibe, :coquan, :latitude, :longitude)
  end
end
