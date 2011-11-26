class QuizzesController < ApplicationController
    
    before_filter :load_level
    before_filter :load_quiz
    before_filter :find_answer
    before_filter :authenticate_user!

    def show
      @answer ||= @quiz.answers.new 
      @next_quiz = @level.quizzes.next(@quiz).first
      @next_level = Level.next(@level).first
    end
    
    
    private

      def load_level
        @levels = Level.all
        @level = Level.find(params[:level_id])
      end
    
      def load_quiz
        @quiz = @level.quizzes.find(params[:id])
      end
      
      def find_answer
        @answer = @quiz.answers.first
      end

end
