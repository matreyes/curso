class Admin::UsersController < AdminController
  def index
    @users = User.participant.page(params[:page]).order('surname DESC')
    unless params[:view_all]
      @users = @users.where(:tutor_id => current_user.id)
    end
    session[:back_to] = admin_users_path(params.slice(:page, :view_all))
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
      redirect_to session[:back_to]
      flash[:notice] = "Has marcado al usuario como revisado"
    else
      render :show
      flash[:alert] = "Error desconocido"
    end
  end
end
