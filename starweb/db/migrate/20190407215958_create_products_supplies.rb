class CreateProductsSupplies < ActiveRecord::Migration[5.2]
  def change
    create_table :products_supplies, :id => false do |t|
      t.references :products
      t.references :supplies
    end
    add_index :products_supplies, :product_id
    add_index :products_supplies, :supply_id
  end 
end
