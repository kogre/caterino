class Customer < ActiveRecord::Base
  belongs_to :table
  has_many :order_notes, :dependent => :destroy
  has_many :payments, :dependent => :destroy
  
  attr_accessible :name, :table_id, :tid, :active
  
  validates :name, :table_id, :presence => true
  #validates :active, :inclusion => { :in => %w(yes paid) }

  #scope :actives, lambda {where('customers.id not in (?)', Payment.all.blank? ? ' ' : Payment.all.map{|p| p.customer_id})}
  scope :actives, where(:active => 'yes')
  scope :paid, where(:active => 'paid')
  
  #before_validation :update_active_cache
  before_create {|c| c.active="yes"}
  
  def update_active_cache
    self.active = cost_due > 0 ? "yes" : "paid"
  end
  
  def active?
    active == "yes"
  end
  
  def tid
    table.id
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
  
end
