class LevelsController < ApplicationController
  
  before_filter :authenticate_user!, except: 'index'
 
  def show
    @level = Level.find(params[:id])
    current_user.set_current_level(@level.id)
  end
  
  def index
  end



end
