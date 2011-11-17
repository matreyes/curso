# == Schema Information
#
# Table name: answers
#
#  id         :integer         not null, primary key
#  quiz_id    :integer
#  user_id    :integer
#  answer     :text
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class AnswerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
