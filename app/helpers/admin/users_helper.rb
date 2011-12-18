module Admin::UsersHelper
  
  def quiz_answer(quiz, user)
    answer = quiz.answers.where(:user_id => user.id).first
    if answer.blank?
      '<span class="label important">ko</span>'.html_safe
    else
      '<span class="label success">ok</span>'.html_safe
    end
  end
  
end
