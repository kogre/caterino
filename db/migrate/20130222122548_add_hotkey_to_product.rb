class AddHotkeyToProduct < ActiveRecord::Migration
  def change
    add_column :products, :hotkey, :string
  end
end
