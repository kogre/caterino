class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.references :customer
      t.integer :amount
      t.string :type

      t.timestamps
    end
    add_index :payments, :customer_id
  end
end
