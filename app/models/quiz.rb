class Quiz < ActiveRecord::Base
  has_one :level
  has_many :answers
  
  default_scope order('id ASC')
  
  
  def next
    where(level_id: self.level_id).where("id < #{self.id}").order('id DESC').first
  end

  def previous
    where(level_id: self.level_id).where("id > #{self.id}").order('id ASC').first
  end
  
end
