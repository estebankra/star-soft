class CreateInfoDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :info_details do |t|
      t.string :firstname
      t.string :lastname
      t.integer :number
      t.string :size

      t.timestamps
    end
  end
end
