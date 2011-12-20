class Admin::UsersController < AdminController
  
  def index
    params[:version] ||= VERSION
    
    @users = User.participant.page(params[:page]).order('surname DESC').where(:version => params[:version])
    
    if params[:q]
      @users = @users.search(params[:q])
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
end
