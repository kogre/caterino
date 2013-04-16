class CreateHalls < ActiveRecord::Migration
  def change
    create_table :halls do |t|
      t.string :name
      t.integer :w
      t.integer :h

      t.timestamps
    end
  end
end
