class FeedbackMailer < ApplicationMailer
  def message_email(user, message)
    @message = message
    @from = user.email
    mail(to: Admin.all.map(&:email) , subject: "Message from #{@from}")
  end
end
