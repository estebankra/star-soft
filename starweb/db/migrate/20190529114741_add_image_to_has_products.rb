class AddImageToHasProducts < ActiveRecord::Migration[5.2]
  def change
  	add_attachment :has_products, :design
  end
end
