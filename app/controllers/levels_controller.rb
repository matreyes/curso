class LevelsController < ApplicationController
  
  before_filter :authenticate_user!, except: 'index'
  before_filter :check_level, only: 'show' 
  
  def show
    @level = Level.find(params[:id])
    @next_level = Level.next(@level).first
    current_user.set_current_level(@level.id)
  end
  
  def index
  end

  private
  
  def check_level
    if params[:id].to_i > current_user.current_level+1
      redirect_to level_path(current_user.current_level)
    end
  end 


end
