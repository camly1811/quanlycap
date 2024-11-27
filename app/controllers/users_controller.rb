class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
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
  private

  def password_params
    # Thêm các trường cần thiết để thay đổi mật khẩu
    params.require(:user).permit(:password, :password_confirmation)
  end
end
