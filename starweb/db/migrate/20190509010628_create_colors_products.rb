class CreateColorsProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :colors_products, :id => false do |t|
    	t.references :product
     	t.references :color
    end
  end
end