class CommentsController < ApplicationController
  before_filter :authenticate_user!, :set_topic
  
  def index
    @comments = Comment.where(topic_id: @topic).page(params[:page]).order('created_at DESC')
    @comment = Comment.new(topic_id: @topic, user_id: current_user)
  end

  def create
    @comment = Comment.new(params[:comment])
    @comment.user_id = current_user.id
    @comment.topic_id = @topic.id
    if @comment.save
      flash[:notice] = 'Comentario enviado'
    else
      flash[:alert] = "Ha ocurrido un error al enviar el comentario"
    end
    redirect_to topic_comments_path(@topic)
  end
  private
  
  def set_topic
    @topic = Topic.find(params[:topic_id])
  end
  
end
