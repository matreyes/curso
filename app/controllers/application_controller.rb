class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :load_levels
  
  def load_levels
    @levels = Level.all
  end
  
  def reload_flash
    return unless request.xhr?
    response.headers['x-flash'] = flash[:error] unless flash[:error].blank?
    response.headers['x-flash'] = flash[:alert] unless flash[:alert].blank?
  end
  
end
