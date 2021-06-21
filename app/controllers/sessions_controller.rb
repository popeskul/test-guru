class SessionsController < Devise::SessionsController
  def create
    super
    flash[:notice] = "#{t('shared.admin_header.welcome')}, #{current_user.full_name}"
  end
end
