class RolesController < ApplicationController
  before_action :set_role, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :check_admin
  # GET /roles or /roles.json
  def index
    @roles = Role.all
  end

  # GET /roles/1 or /roles/1.json
  def show
  end

  # GET /roles/new
  def new
    @role = Role.new
  end

  # GET /roles/1/edit
  def edit
  end

  # POST /roles or /roles.json
  def create
    @role = Role.new(role_params)

    respond_to do |format|
      if @role.save
        format.html { redirect_to roles_path, notice: "Role was successfully created." }
        format.json { render :show, status: :created, location: @role }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /roles/1 or /roles/1.json
  def update
    respond_to do |format|
      if @role.update(role_params)
        format.html { redirect_to roles_path, notice: "Role was successfully updated." }
        format.json { render :show, status: :ok, location: @role }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /roles/1 or /roles/1.json
  def destroy
    @role.destroy

    respond_to do |format|
      format.html { redirect_to roles_url, notice: "Role was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  
  def bulk_delete
    if params[:role_ids].present?
      # Xóa các vai trò có ID trong params[:role_ids]
      roles_to_delete = Role.where(id: params[:role_ids])
      
      if roles_to_delete.destroy_all
        render json: { success: true }
      else
        render json: { success: false }, status: :unprocessable_entity
      end
    else
      render json: { success: false, message: 'Không có vai trò nào được chọn' }, status: :unprocessable_entity
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_role
      @role = Role.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def role_params
      params.require(:role).permit(:name, :description)
    end
end
