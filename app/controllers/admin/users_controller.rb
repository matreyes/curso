# coding: UTF-8

class Admin::UsersController < AdminController

  def index
    params[:version] ||= VERSION

    @users = User.participant.page(params[:page]).order('surname ASC').where(:version => params[:version])

    if params[:view_all] || params[:q]
      @put_tutor = true
    end

    if params[:q]
      @users = User.participant.page(params[:page]).search(params[:q]).order('surname ASC')
    else
      unless params[:view_all]
        @users = @users.where(:tutor_id => current_user.id)
      end
    end
    session[:back_to] = admin_users_path(params.slice(:page, :view_all, :q, :version))
  end

  def index_tutors
    @users = User.order('surname DESC').where(:is_admin => true)
  end

  def show
    @user = User.find(params[:id])
    @quizzes = Quiz.all
    @answers = @quizzes.map do |quiz|
      quiz.answers.where(:user_id => @user.id).first
    end
  end

  def update
    @user = User.find(params[:id])
    @user.checked_at = Time.now
    if @user.save
      unless params[:body].blank?
        AdminMailer.send_review(current_user, @user, params[:subject], params[:body]).deliver
      end
      redirect_to session[:back_to]
      flash[:notice] = "Has marcado al usuario como revisado"
    else
      render :show
      flash[:alert] = "Error desconocido"
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "El usuario ha sido eliminado"
    else
      flash[:alert] = "Error al eliminar el usuario"
    end
    redirect_to session[:back_to]
  end

  def deliver_email
    if params[:subject] == ""
      flash[:alert] = "Debe escribir un asunto"
      return false
    end
    if params[:text] == ""
      flash[:alert] = "Debe escribir un mensaje"
      return false
    end
    if request.post?
      Delayed::Job.enqueue PrepareEmailsJob.new(current_user, params[:all], params[:version], params[:subject], params[:text])
      flash[:notice] = "El mensaje se ha enviado"
      respond_to do |format|
        format.js
      end
    end
  end

  def update_csv
    fd = File.open(Rails.root.join("csv", "alumnos.csv"), 'w+')
    fd.write(open(User::CSV_URL).read)
    fd.close
    flash[:notice] = "Lista actualizada correctamente"
  rescue
    logger.info "==============================="
    logger.info "== $!: #{$!} =="
    logger.info "==============================="

    flash[:alert] = "No se ha podido actualizar la lista. Esperen o llamen a Matías"
  ensure
    redirect_to admin_users_path
  end

end
