class AdminController < ApplicationController
  before_filter :user_is_admin
end