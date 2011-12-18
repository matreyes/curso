class Admin::UsersController < AdminController
  def index
    @users = User.participant.page(params[:page]).order('surname DESC')
  end
  
  def show
    @user = User.find(params[:id])
    @quizzes = Quiz.all 
    @answers = @quizzes.map do |quiz|
      quiz.answers.where(:user_id => @user.id).first
    end
  end
end
