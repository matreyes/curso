class LevelsController < ApplicationController
  
  before_filter :authenticate_user!, except: 'index'
  before_filter :check_level, only: 'show' 
  
  def show
    @level = Level.find(params[:id])
    @next_level = Level.next(@level).first
    current_user.set_current_level(@level.sequence)
  end
  
  def index
  end

  private
  
  def check_level
    if Level.find(params[:id]).sequence > current_user.current_level+1
      redirect_to level_path(Level.where(sequence: current_user.current_level).first.id)
    end
  end 


end
