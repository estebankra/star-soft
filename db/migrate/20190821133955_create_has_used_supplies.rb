class CreateHasUsedSupplies < ActiveRecord::Migration[5.2]
  def change
    create_table :has_used_supplies do |t|
      t.references :order, foreign_key: true
      t.references :supply, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end