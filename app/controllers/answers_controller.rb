class AnswersController < ApplicationController

  def create
    @answer = Answer.new(params[:answer])
    @answer.quiz_id = params[:quiz_id]
    if @answer.save
      flash[:notice] = 'La respuesta ha sido enviada'
      render "/quizzes/alert.js.erb"
    else
      flash[:alert] = 'La respuesta no se ha enviado'
    end
   
  end


  def update
    @answer = Answer.find(params[:id])
    if @answer.update_attributes(params[:answer])
      flash[:notice] = 'La respuesta ha sido enviada'
      render "/quizzes/alert.js.erb"
    else
      flash[:alert] = 'La respuesta no se ha enviado'
    end
  end


end
