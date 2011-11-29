module ApplicationHelper
 
  def tutor_block
      if current_user && current_user.tutor
        content_tag :div, current_user.tutor.email, class: 'tutor'
      end
  end

end
