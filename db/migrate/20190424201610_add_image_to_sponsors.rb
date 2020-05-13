class AddImageToSponsors < ActiveRecord::Migration[5.2]
  def change
  	add_attachment :sponsors, :image
  end
end
