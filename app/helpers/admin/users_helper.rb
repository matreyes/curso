module Admin::UsersHelper
  
  def quiz_answer(quiz, user)
    answer = quiz.answers.where(:user_id => user.id).first
    if answer.blank?
      '<span class="label important">ko</span>'.html_safe
    else
      if user.checked_at.blank? || user.checked_at > answer.updated_at
        '<span class="label success">ok</span>'.html_safe
      else
        '<span class="label warning">rev</span>'.html_safe
      end
    end
  end
  
end
