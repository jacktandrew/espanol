class Card < ActiveRecord::Base
  attr_accessible :en, :es, :pic, :level, :category
  before_validation :default_values
  
  validates :en, presence: true, uniqueness: true
  validates :es, presence: true, uniqueness: true
  validates :pic, presence: true, uniqueness: true
  validates :level, numericality: {greater_than: 0, less_than: 4, message: 'must be from 1-3'}
  
  private

  def default_values
    if self.category.length < 2
      self.category = 'none'
    end
    self.level ||= 1
  end

end
