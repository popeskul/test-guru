class ApplicationMailer < ActionMailer::Base
  default from: ENV['SMTP_USERNAME']||%("TestGuru" <peterjob91@gmail.com>)
  layout 'mailer'
end
