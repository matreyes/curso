class Admin::UsersController < AdminController
  def index
    @users = User.participant.page(params[:page]).order('name DESC')
  end
end
