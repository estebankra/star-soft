class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :doc_ruc, null: false
      t.integer :phone, null: false
      t.date :date_nac
      t.string :email
      t.string :city
      t.string :country
      t.boolean :in_trash, default: false

      t.timestamps
    end
  end
end
