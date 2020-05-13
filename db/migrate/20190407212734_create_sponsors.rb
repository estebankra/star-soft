class CreateSponsors < ActiveRecord::Migration[5.2]
  def change
    create_table :sponsors do |t|
      t.string :name, null: false
      t.string :image
      t.boolean :in_trash, default: false

      t.timestamps
    end
  end
end
