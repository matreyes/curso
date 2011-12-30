class TopicsController < ApplicationController
  
  before_filter :authenticate_user!

  def index
    if Rails.env == "production"
      random = "RAND()"
    else
      random = "RANDOM()"
    end
    @users = User.where("avatar IS NOT NULL AND id IS NOT ?", current_user.id).order(random).limit(20)
    @topics = Topic.all
  end

end
