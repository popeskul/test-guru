class FeedbackController < ApplicationController
  before_action :authenticate_user!

  def send_message
    FeedbackMailer.message_email(current_user, params[:message]).deliver_now
    flash.now[:notice] = t('.success')
    redirect_to root_path
  rescue StandardError => e
    flash.now[:alert] = e.to_s
  end

  def new; end

  private

  def feedback_params
    params.require(:feedback).permit(:message)
  end
end
