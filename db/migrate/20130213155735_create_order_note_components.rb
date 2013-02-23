class CreateOrderNoteComponents < ActiveRecord::Migration
  def change
    create_table :order_note_components do |t|
      t.integer :amount
      t.references :order_note
      t.references :product

      t.timestamps
    end
    add_index :order_note_components, :order_note_id
    add_index :order_note_components, :product_id
  end
end
