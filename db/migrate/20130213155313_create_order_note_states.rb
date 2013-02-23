class CreateOrderNoteStates < ActiveRecord::Migration
  def change
    create_table :order_note_states do |t|
      t.string :state
      t.references :order_note

      t.timestamps
    end
    add_index :order_note_states, :order_note_id
  end
end
