class CreateSupplies < ActiveRecord::Migration[5.2]
  def change
    create_table :supplies do |t|
      t.string :name, null: false
      t.string :image
      t.integer :stock, null: false
      t.string :description
      t.boolean :in_trash, default: false

      t.timestamps
    end
  end
end
