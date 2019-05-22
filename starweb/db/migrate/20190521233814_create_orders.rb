class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.date :date
      t.date :deliver_date
      t.references :client, foreign_key: true
      t.string :course_club
      t.string :logo
      t.string :state

      t.timestamps
    end
  end
end
