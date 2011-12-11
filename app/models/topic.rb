# == Schema Information
#
# Table name: topics
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  abstract   :text
#  position   :integer
#  created_at :datetime
#  updated_at :datetime
#

class Topic < ActiveRecord::Base
  has_many :comments
  validates_presence_of :name
end

