class CreateTables < ActiveRecord::Migration
  def change
    create_table :tables do |t|
      t.integer :x
      t.integer :y
      t.integer :h
      t.integer :w
      t.integer :capacity
      t.integer :tid

      t.timestamps
    end
  end
end
