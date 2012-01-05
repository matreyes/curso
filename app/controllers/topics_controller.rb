class TopicsController < ApplicationController

  before_filter :authenticate_user!

  def index
    MAX = 66
    offset = User.with_avatar.count - MAX
    start_in = offset < 0 ? 0 : rand(offset)

    @users = User.with_avatar.limit(MAX).offset(start_in).sort_by{ rand }
    @topics = Topic.all
  end

end
