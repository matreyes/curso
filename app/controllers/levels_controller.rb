class LevelsController < ApplicationController
  before_filter :load_levels
 
  def show
    @level = Level.find(params[:id])
  end
  
  def index
  end

  private
  def load_levels
    @levels = Level.all
  end

end
