class CreateOrderNotes < ActiveRecord::Migration
  def change
    create_table :order_notes do |t|
      t.references :customer

      t.timestamps
    end
    add_index :order_notes, :customer_id
  end
end
