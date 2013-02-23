class ChangeDataTypeForPaymentAmount < ActiveRecord::Migration
  def change
    change_column :payments, :amount, :decimal, :precision => 6, :scale => 2
  end
end
