class OrderNoteComponent < ActiveRecord::Base
  belongs_to :order_note
  belongs_to :product
  attr_accessible :amount, :product, :product_id
  
  validates :product, :amount, :presence => true

end
