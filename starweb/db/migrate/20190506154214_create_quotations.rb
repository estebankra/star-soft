class CreateQuotations < ActiveRecord::Migration[5.2]
  def change
    create_table :quotations do |t|
      t.references :currencies, foreign_key: true
      t.string :purchase
      t.string :sale

      t.timestamps
    end
  end
end
