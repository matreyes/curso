class QuizzesController < ApplicationController
    
    before_filter :load_level
    before_filter :load_quiz
    before_filter :find_answer


    def show
      @answer ||= @quiz.answers.new 
    end
    
    
    private

      def load_level
        @level = Level.find(params[:level_id])
      end
    
      def load_quiz
        @quiz = @level.quizzes.find(params[:id])
      end
      
      def find_answer
        @answer = @quiz.answers.first
      end

end
