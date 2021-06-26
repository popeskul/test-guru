class FeedbackMailer < ApplicationMailer
  def message_email(user, message)
    @message = message
    @from = user.email
    Admin.all.each do |admin|
      mail(to: admin.email , subject: "Message from #{@from}")
    end
  end
end
