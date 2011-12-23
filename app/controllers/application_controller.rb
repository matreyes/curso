class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :load_levels
  
  def load_levels
    @levels ||= Level.order("sequence ASC").all
  end
  
  def user_is_admin
    if authenticate_user!
      unless current_user.is_admin?
        redirect_to root_path and return false
      end
    end
  end
  
end
