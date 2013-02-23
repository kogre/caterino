class ProductGroup < ActiveRecord::Base
  validates :ordering, :uniqueness => true
  validates :name, :ordering, :presence => true
  
  attr_accessible :name, :ordering
  
  has_many :products
end
