class CreateHasDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :has_details do |t|
      t.references :order, foreign_key: true
      t.references :order_detail, foreign_key: true

      t.timestamps
    end
  end
end
