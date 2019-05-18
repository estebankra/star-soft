class CreateHasSupplies < ActiveRecord::Migration[5.2]
  def change
    create_table :has_supplies do |t|
      t.references :product, foreign_key: true
      t.references :supply, foreign_key: true

      t.timestamps
    end
  end
end
