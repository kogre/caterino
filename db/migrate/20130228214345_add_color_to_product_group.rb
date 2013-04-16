class AddColorToProductGroup < ActiveRecord::Migration
  def change
    add_column :product_groups, :color, :string
  end
end
