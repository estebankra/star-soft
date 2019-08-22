class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      t.string :name, null: false
      t.string :number
      t.string :size

      t.timestamps
    end
  end
end
