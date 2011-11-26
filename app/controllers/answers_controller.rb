class AnswersController < ApplicationController
  
  def create
    @answer = Answer.new(params[:answer])
    @answer.quiz_id = params[:quiz_id]
    if @answer.save
      render "/quizzes/alert.js.erb"
    else
      flash.now[:alert] = 'Debe escribir una respuesta'
      render "/layouts/render_flash.js.erb"
      
    end
  end


  def update
    @answer = Answer.find(params[:id])
    if @answer.update_attributes(params[:answer])
      render "/quizzes/alert.js.erb"
    else
      flash.now[:alert] = 'Debe escribir una respuesta'
      render "/layouts/render_flash.js.erb"
    end
  end

end
