class Table < ActiveRecord::Base
  attr_accessible :capacity, :h, :tid, :w, :x, :y, :hall_id, :customers
  
  has_many :customers
  belongs_to :hall
  
  validates :tid, :uniqueness => true
  validates :tid, :presence => true
  
  after_save :broadcast_table_update
  
  def broadcast_table_update
    hall.broadcast_table_update(self) if hall.present?
  end
  
end
