class Product < ApplicationRecord
	# belongs_to :supply
	# belongs_to :color
  has_many :has_supplies
  has_many :supplies, through: :has_supplies
  has_many :orders, through: :has_products


  before_update :clear_supplies
  before_destroy :clear_supplies
	after_create :save_supplies
  after_update :save_supplies

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

  def clear_supplies
    HasSupply.all.each do | hasSupply |
      if hasSupply.product_id == self.id
        HasSupply.destroy(hasSupply.id)
      end
    end
  end
  
  # For search
  def self.search(term)
		if term
		  where("name ILIKE ?", "%#{term}%").order('id DESC')
		else
		  order('id DESC')
		end
	end
end