class TopicsController < ApplicationController
  
  before_filter :authenticate_user!

  def index
    @users = User.where("avatar IS NOT NULL AND id IS NOT ?", current_user.id).order("RANDOM()").limit(20)
    @topics = Topic.all
  end

end
