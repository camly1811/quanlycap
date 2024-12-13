class ApplicationController < ActionController::Base
  # Thêm `role_ids` vào các tham số được phép
  before_action :configure_permitted_parameters, if: :devise_controller?
  def check_admin
    raise ForbiddenError unless current_user.roles.exists?(name: 'admin')
  end
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[role_ids first_name last_name phone address gender])  
  end

    # Ghi đè logic sau khi người dùng đăng nhập
    def after_sign_in_path_for(resource)
      # Kiểm tra vai trò người dùng
      if resource.admin?
        admin_bes_path
      else
        root_path
      end
    end
end
