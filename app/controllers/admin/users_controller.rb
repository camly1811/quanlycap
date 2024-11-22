module Admin
  class UsersController < ApplicationController
    before_action :authenticate_user!
    # before_action :check_admin
    def index
      @users = User.all.includes(:roles) # Sử dụng `includes(:roles)` để tránh N+1 query
    end
    
    def show_current
      @user = current_user  # Lấy thông tin người dùng hiện tại
    end

    # New actions for password change
    def change_password
      @user = current_user  # Fetch the current user
    end

    def update_password
      @user = current_user
      # Kiểm tra mật khẩu hiện tại có đúng không
      if @user.valid_password?(params[:user][:current_password])
        if @user.update(password_params)
          redirect_to new_user_session_path, notice: 'Mật khẩu đã được cập nhật thành công.'
        else
          render :change_password, alert: 'Lỗi khi cập nhật mật khẩu.'
        end
      else
        @user.errors.add(:current_password, 'Mật khẩu không chính xác.')
        render :change_password
      end
    end

    def destroy
      @user = User.find(params[:id])
      if @user.destroy
        flash[:alert] = "Người dùng đã bị xóa"
        redirect_to admin_users_path
      else
        flash[:alert] = "Bị lỗi không xóa được"
      end
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
      if @user.save
        flash[:notice] = "Người dùng đã được tạo thành công."
        redirect_to admin_users_path
      else
        flash[:alert] = "Có lỗi khi tạo người dùng."
        render :new
      end
    end
    private

    def password_params
      # Thêm các trường cần thiết để thay đổi mật khẩu
      params.require(:user).permit(:password, :password_confirmation)
    end

    def user_params
      # Các trường cần thiết để tạo người dùng mới
      params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :gender, :phone, :address, :role_ids)
    end
  end
end
