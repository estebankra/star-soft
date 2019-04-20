class CreateProductsSupplies < ActiveRecord::Migration[5.2]
  def change
    create_table :products_supplies, :id => false do |t|
      t.references :products
      t.references :supplies

      t.timestamps
    end
  end 
end
