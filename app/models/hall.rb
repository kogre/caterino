class Hall < ActiveRecord::Base
  attr_accessible :h, :name, :w, :tables_attributes
  has_many :tables
  
  accepts_nested_attributes_for :tables, :allow_destroy => true
  
  def broadcast_table_update(table)
    WebsocketRails[("hall" + id.to_s).to_sym].trigger(:table_update, table)
  end
  
end
