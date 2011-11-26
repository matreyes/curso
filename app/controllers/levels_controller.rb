class LevelsController < ApplicationController
  
  before_filter :authenticate_user!
 
  def show
    @level = Level.find(params[:id])
  end
  
  def index
  end



end
