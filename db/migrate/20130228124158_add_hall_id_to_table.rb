class AddHallIdToTable < ActiveRecord::Migration
  def change
    add_column :tables, :hall_id, :integer
    add_index :tables, :hall_id
  end
end
