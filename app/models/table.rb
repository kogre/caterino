class Table < ActiveRecord::Base
  attr_accessible :capacity, :h, :tid, :w, :x, :y
  
  has_many :customers
  
  validates :tid, :uniqueness => true
  validates :tid, :presence => true
  
end
