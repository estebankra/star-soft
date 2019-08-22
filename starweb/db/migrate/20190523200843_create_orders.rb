class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.date :deliver_date
      t.references :client, foreign_key: true
      t.string :course_club
      t.string :logo
      t.string :state, default: 'En espera'
      t.string :paid, default: 'No pagado'
      t.string :notes
      t.boolean :in_trash, default: false

      t.timestamps
    end
  end
end
