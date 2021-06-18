class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(user)
    if user.admin?
      admin_tests_path
    else
      tests_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :type])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :type])
  end
end
