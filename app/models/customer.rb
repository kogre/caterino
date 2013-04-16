class Customer < ActiveRecord::Base
  belongs_to :table
  has_many :order_notes, :dependent => :destroy
  has_many :payments, :dependent => :destroy
  
  attr_accessible :name, :table_id, :tid, :active, :table
  
  validates :name, :table_id, :presence => true
  #validates :active, :inclusion => { :in => %w(yes paid) }

  scope :actives, where(:active => 'yes')
  scope :paid, where(:active => 'paid')
  
  before_create {|c| c.active="yes"}
  before_save :broadcast_table_update
  
  def broadcast_table_update
    Table.find(table_id_was).broadcast_table_update if table_id_changed? unless table_id_was.nil?
    table.broadcast_table_update
  end
  
  def update_active_cache
    self.active = cost_due > 0 ? "yes" : "paid"
  end
  
  def active?
    active == "yes"
  end
  
  def tid
    table.tid
  end
  
  def total_cost
    total=0
    order_notes.each do |on|
      on.order_note_components.each do |onc|
        total += onc.product.price * onc.amount
      end
    end
    total
  end
  
  def cost_paid
    Payment.where(:customer_id => self.id).where(:status => "paid").sum("amount")
  end
  
  def cost_due
    total_cost - cost_paid
  end
  
  def to_s
    name+"("+tid.to_s+")"
  end
  
  def highest_product_group
    highest_ordering = 0
    result = nil
    
    order_notes.includes(:order_note_components).each do |on|
      on.order_note_components.each do |onc|
        if onc.product.product_group.ordering > highest_ordering
          highest_ordering = onc.product.product_group.ordering
          result = onc.product.product_group
        end
      end
    end
    
    result
  end
  
end
