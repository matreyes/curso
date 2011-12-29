class MainMailer < ActionMailer::Base

  def send_mail(user, to_email, message)
    @message = message
    mail(to: to_email, from: user.email, subject: "[Mensaje]: #{user}")
  end


end
