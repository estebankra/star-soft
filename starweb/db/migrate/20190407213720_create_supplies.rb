class CreateSupplies < ActiveRecord::Migration[5.2]
  def change
    create_table :supplies do |t|
      t.string :name
      t.string :image
      t.string :stock
      t.string :description

      t.timestamps
    end
  end
end
