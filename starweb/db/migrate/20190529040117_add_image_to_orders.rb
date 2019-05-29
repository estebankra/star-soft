class AddImageToOrders < ActiveRecord::Migration[5.2]
  def change
  	add_attachment :orders, :logo
  end
end
