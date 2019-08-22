class CreateHasProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :has_products do |t|
      t.references :order, foreign_key: true
      t.references :product, foreign_key: true
      t.string :specs_f
      t.string :specs_b
      t.integer :quantity

      t.timestamps
    end
  end
end
