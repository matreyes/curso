class TopicsController < ApplicationController

  before_filter :authenticate_user!

  def index
    max = 66
    offset = User.with_avatar.count - max
    start_in = offset < 0 ? 0 : rand(offset)

    @users = User.with_avatar.limit(max).offset(start_in).sort_by{ rand }
    @topics = Topic.all
  end

end
