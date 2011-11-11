class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :load_levels
  
  def load_levels
    @levels = Level.all
  end
end
