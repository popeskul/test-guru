class FeedbackController < ApplicationController
  before_action :authenticate_user!

  def send_message
    FeedbackMailer.message_email(current_user, params[:message]).deliver_now
    flash[:notice] = t('.success')
    redirect_to root_path
  end

  def new; end

  private

  def feedback_params
    params.require(:message).permit(:message)
  end
end
