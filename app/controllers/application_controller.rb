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
end
