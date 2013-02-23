class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.references :table
      t.string :name

      t.timestamps
    end
    add_index :customers, :table_id
  end
end
