class CreateInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices do |t|
      t.date :date
      t.boolean :counted_credit
      t.references :order, foreign_key: true
      t.decimal :iva5
      t.decimal :iva10
      t.decimal :total

      t.timestamps
    end
  end
end
