# == Schema Information
#
# Table name: comments
#
#  id         :integer         not null, primary key
#  text       :text
#  topic_id   :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Comment < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user
  validates_presence_of :text
  
  # will_paginate method
  self.per_page = 20
  
  def user_name
    self.user.name
  end
  
end
