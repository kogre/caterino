class Product < ActiveRecord::Base
  validates :pid, :uniqueness => true
  validates :pid, :name, :price, :product_group_id, :presence => true
  validates :hotkey, :uniqueness => true
  
  attr_accessible :active, :name, :pid, :price, :product_group_id, :hotkey
  
  belongs_to :product_group
  has_many :order_note_components
  
  scope :actives, where(:active => true)
  
end
