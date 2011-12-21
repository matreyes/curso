class MainMailer < ActionMailer::Base

  def send_mail(user, to_email, message)
    @message = message
    mail(to: to_email, from: user.email, subject: "[Mensaje 24+5] de: #{user}")
  end


end
