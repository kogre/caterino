class OrderNoteState < ActiveRecord::Base
  belongs_to :order_note

  attr_accessible :state
  
  validates :state, :inclusion => { :in => %w(ordered prepared delivered) }
  
  def self.ORDERED
    "ordered"
  end
  
  def self.PREPARED
    "prepared"
  end
  
  def self.DELIVERED
    "delivered"
  end
end
