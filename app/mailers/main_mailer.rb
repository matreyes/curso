class MainMailer < ActionMailer::Base
    
  def send_mail(user, to_email, message)
    @message = message
    mail(to: to_email, :from => 'mensajes@pasa.cl', reply_to: user.email, subject: "[Mensaje]: #{user}")
  end


end
