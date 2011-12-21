class MainController < ApplicationController

  def send_mail
    if params[:text].blank?
      flash.now[:alert] = "No se puede enviar un mensaje en blanco."
      render "/layouts/render_flash.js.erb"
    else
      if MainMailer.send_mail(current_user, current_user.tutor.email, params[:text]).deliver
        flash.now[:notice] = "El correo fue enviado a #{current_user.tutor}"
        render "/layouts/render_flash.js.erb"
      else
        flash.now[:alert] = "Ha ocurrido un error al enviar el correo."
        render "/layouts/render_flash.js.erb"
      end
    end
  end
  
end