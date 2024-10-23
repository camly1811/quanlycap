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
        format.json { render json: @be, status: :created } # Return the created be object
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
      format.html { redirect_to bes_path, status: :see_other, notice: 'Bể đã được xóa thành công.' }
      format.json { render json: { message: 'Bể đã xóa thành công' }, status: :ok }
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
