class Product < ApplicationRecord
  belongs_to :supply
  has_many :has_supplies
  has_many :supplies, through: :has_supplies
  has_many :orders, through: :has_products

  before_update :clear_supplies
  before_destroy :clear_supplies
  after_create :save_supplies
  after_update :save_supplies

  # Validation
  validates :name, :description, presence: true
  validates :price, presence: true
  validates :description, length: { minimum: 40 }

  has_attached_file :image, styles: { medium: '600x300', thumb: '300x150', mini: '200x100' }
  validates_attachment_content_type :image, content_type: %r{\Aimage/.*\Z}

  attr_writer :supplies

  def save_supplies
    @supplies.each do |supply_id|
      HasSupply.create(supply_id: supply_id, product_id: self.id )
    end
  end

  def clear_supplies
    HasSupply.all.each do | has_supply |
      HasSupply.destroy(has_supply.id) if has_supply.product_id == self.id
    end
  end
end