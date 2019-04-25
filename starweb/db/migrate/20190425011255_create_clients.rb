class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :firstname
      t.string :lastname
      t.string :doc_ruc
      t.string :telephone
      t.date :date_nac
      t.string :mail
      t.string :city
      t.string :country

      t.timestamps
    end
  end
end
