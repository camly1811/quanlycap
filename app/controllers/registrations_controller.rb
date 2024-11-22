class RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    unless user_signed_in?
      redirect_to new_user_session_path, alert: "You must be logged in to sign up."
    else
      super
    end
  end

  def create
    super
  end
end