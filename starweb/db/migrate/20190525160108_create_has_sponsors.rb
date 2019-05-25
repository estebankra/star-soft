class CreateHasSponsors < ActiveRecord::Migration[5.2]
  def change
    create_table :has_sponsors do |t|
      t.references :order, foreign_key: true
      t.references :sponsor, foreign_key: true

      t.timestamps
    end
  end
end
