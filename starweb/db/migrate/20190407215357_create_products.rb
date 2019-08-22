class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price, precision: 20, scale: 4
      t.string :image
      t.string :description
      t.boolean :in_trash, default: false

      t.timestamps
    end
  end
end
