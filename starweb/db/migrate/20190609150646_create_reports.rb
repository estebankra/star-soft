class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.integer :num_clients

      t.timestamps
    end
  end
end
