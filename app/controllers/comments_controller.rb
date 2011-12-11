class CommentsController < ApplicationController
  before_filter :authenticate_user!, :set_topic
  
  def index
    @comments = Comment.where(topic_id: @topic).page(params[:page]).order('created_at DESC')
  end

  
  
  private
  
  def set_topic
    @topic = Topic.find(params[:topic_id])
  end
  
end
