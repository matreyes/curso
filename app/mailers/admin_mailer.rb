class AdminMailer < ActionMailer::Base
  
  def send_review(admin, user, subject, message)
    @message = message
    mail(to: user.email, bcc: user.tutor.email, from: admin.email, subject: "[24+5]: "+subject)
  end

end
