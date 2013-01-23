class Game < ActiveRecord::Base
  attr_accessible :category, :level, :matchless, :name, :size
end
