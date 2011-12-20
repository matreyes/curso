module LevelsHelper
  
  def quiz_answer(level, quiz, user)
    answer = quiz.answers.where(:user_id => user.id).first
    if answer.blank?
      # Blank
      "<span class='label'>P#{quiz.id}</span>".html_safe
    else
      if !user.checked_at.blank? && user.checked_at > answer.updated_at
        # OK
        levellink_to "<span class='label success'>P#{quiz.id}</span>".html_safe, level_quiz_path(level, quiz)
      else
        # Waiting for feedback
        link_to "<span class='label warning'>P#{quiz.id}</span>".html_safe, level_quiz_path(level, quiz)
      end
    end
  end
  
  def no_link_quiz_answer(quiz, user)
    answer = quiz.answers.where(:user_id => user.id).first
    if answer.blank?
      "<span class='label'>P#{quiz.id}</span>".html_safe
    else
      if !user.checked_at.blank? && user.checked_at > answer.updated_at
        "<span class='label success'>P#{quiz.id}</span>".html_safe
      else
        "<span class='label warning'>P#{quiz.id}</span>".html_safe
      end
    end
  end
  
end
