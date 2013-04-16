class OrderNote < ActiveRecord::Base
  belongs_to :customer
  
  has_many :order_note_components
  has_many :order_note_states
  
  #validates :customer_id, :presence => true
  attr_accessible :customer, :order_note_components_attributes, :customer_attributes, :customer_id
  
  accepts_nested_attributes_for :order_note_components, :reject_if => lambda { |a| ( a[:amount].to_i == 0) }, :allow_destroy => true
  accepts_nested_attributes_for :customer
  
  after_save :update_customer_active_cache
  after_save {|on| on.customer.table.broadcast_table_update}
  after_destroy :update_customer_active_cache
  
  self.per_page = 25
  
  def update_customer_active_cache
    customer.update_active_cache
    customer.save
  end
  
  def state
    order_note_states.order("created_at DESC").first.state
  end
  
  def cost
    total = 0
    order_note_components.each do |onc|
      total += onc.product.price * onc.amount
    end
    total
  end
  
end
