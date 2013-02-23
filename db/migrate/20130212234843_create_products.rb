class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :pid
      t.string :name
      t.decimal :price
      t.boolean :active

      t.timestamps
    end
  end
end
