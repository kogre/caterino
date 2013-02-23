class AddProductGroupIdToProduct < ActiveRecord::Migration
  def change
    add_column :products, :product_group_id, :integer
    add_index :products, :product_group_id
  end
end
