class Payment < ActiveRecord::Base
  self.inheritance_column = "inheritance_type" #allows column 'type' to be custom used

  belongs_to :customer
  attr_accessible :amount, :type, :status
  
  validates :amount, :type, :customer_id, :presence => true
  validates :type, :inclusion => { :in => %w(cash card presale) }
  validates :status, :inclusion => { :in => %w(requested paid) }
  
  after_save :update_customer_active_cache
  after_destroy :update_customer_active_cache
  
  def update_customer_active_cache
    customer.update_active_cache
    customer.save
  end
    
end
