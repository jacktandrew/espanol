class Game < ActiveRecord::Base
  attr_accessible :name, :level, :category, :size, :matchless, :correct
  before_validation :default_values
  
  validates :name, presence: true, uniqueness: true
  validates :size, presence: true
  validates :matchless, presence: true
  validates :level, numericality: {greater_than: -1, less_than: 4, message: 'must be from 1-3'}
  
  private

  def default_values
    if self.category.length < 2
      self.category = 'none'
    end
    self.matchless ||= 0
    self.level ||= 0
  end  

end
