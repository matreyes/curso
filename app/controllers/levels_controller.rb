class LevelsController < ApplicationController
  
  before_filter :authenticate_user!, except: 'index'
  before_filter :check_level, only: 'show' 
  before_filter :set_browser, only: 'index'
  
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
      if current_user.current_level > 0
        redirect_to level_path(Level.where(sequence: current_user.current_level).first.id)
      else
        redirect_to levels_path
      end
    end
  end 


  def set_browser
    user_agent =  request.env['HTTP_USER_AGENT'].try(:downcase)
    if user_agent && user_agent.index('msie')
      @ie = true 
    else
      @ie = false
    end
  end
  
end
