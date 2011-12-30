class TopicsController < ApplicationController
  
  before_filter :authenticate_user!

  def index
    @users = User.where("avatar IS NOT NULL AND id <> ?", current_user.id).limit(60).sort_by{ rand }
    @topics = Topic.all
  end

end
