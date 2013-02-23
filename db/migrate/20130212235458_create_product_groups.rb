class CreateProductGroups < ActiveRecord::Migration
  def change
    create_table :product_groups do |t|
      t.integer :ordering
      t.string :name

      t.timestamps
    end
  end
end
