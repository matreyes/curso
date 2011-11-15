class Quiz < ActiveRecord::Base
  has_one :level
  has_many :answers
  
  scope :next, lambda { |p| {:conditions => ["id > ?", p.id], :limit => 1, :order => "id"} }

  
end
