# == Schema Information
#
# Table name: quizzes
#
#  id               :integer         not null, primary key
#  level_id         :integer
#  question         :text
#  created_at       :datetime
#  updated_at       :datetime
#  instant_feedback :text
#

require 'test_helper'

class QuizTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
