class AddQuantityAndNotesToOrderDetails < ActiveRecord::Migration[5.2]
  def change
    add_column :order_details, :quantity, :integer
    add_column :order_details, :notes, :string
  end
end
