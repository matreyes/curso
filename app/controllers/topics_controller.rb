class TopicsController < ApplicationController
  
  before_filter :authenticate_user!

  def index
    @topics = Topic.all
  end

end
