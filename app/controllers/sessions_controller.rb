class SessionsController < Devise::SessionsController
# def create
  #   user = User.find_by(email: params[:email])
  #
  #   if user&.authenticate(params[:password])
  #     session[:user_id] = user.id
  #     redirect_to cookies[:current_url] || root_path, notice: 'You are successfully logged in'
  #   else
  #     flash.now[:alert] = 'Are you a Guru? Verify your Email and Password please'
  #     render :new
  #   end
  # end
  #
  # def destroy
  #   session[:user_id] = nil
  #   cookies[:current_url] = nil
  #   redirect_to login_path, notice: 'You are signed out of the system'
  # end

  def create
    super
    flash[:notice] = 'Hello, #{current_user.full_name}'
  end
end
