class Product < ApplicationRecord
	# belongs_to :supply
	# belongs_to :color
  has_many :has_supplies
  has_many :supplies, through: :has_supplies

	after_create :save_supplies
  before_destroy :clear_categories

	has_attached_file :image, styles: { medium: "600x300", thumb: "300x150", mini: "200x100" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  def supplies=(value)
  	@supplies = value
  end

  def save_supplies
  	@supplies.each do |supply_id|
  		HasSupply.create(supply_id: supply_id, product_id: self.id )
  	end
  end

  def clear_categories 
    HasSupply.all.each do | hasSupply |
      if hasSupply.product_id == self.id
        HasSupply.destroy(hasSupply.id)
      end
    end
  end
end