class AddImageToSupplies < ActiveRecord::Migration[5.2]
  def change
  	add_attachment :supplies, :image
  end
end
