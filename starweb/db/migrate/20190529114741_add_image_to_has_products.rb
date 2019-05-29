class AddImageToHasProducts < ActiveRecord::Migration[5.2]
  def change
  	add_attachment :supplies, :design
  end
end
