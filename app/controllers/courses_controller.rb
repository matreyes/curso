class CoursesController < ApplicationController
  before_filter :find_course

  def index
    @courses = Courses.all
  end

  def view
  end

private
  def find_course
    @course = Courses.find(params[:id]) if params[:id]
  end
end