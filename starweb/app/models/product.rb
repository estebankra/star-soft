class Product < ApplicationRecord
  has_many :has_supplies
  has_many :supplies, through: :has_supplies
  has_many :orders, through: :has_products

  # Validation
  validates :name, :price, :image, presence: true
  validates :price, numericality: true
  validates :description, length: { maximum: 300 }

  # before_update :clear_supplies
  after_create :save_supplies
  after_update :save_supplies


  has_attached_file :image, styles: { medium: '600x300', thumb: '300x150', mini: '200x100' }
  validates_attachment_content_type :image, content_type: %r{\Aimage/.*\Z}

  attr_writer :supplies

  def save_supplies
    if @supplies.nil?
      return
    else
      @supplies.each do |supply_id|
        exists = false
        self.supplies.each do |product_supply|
          id = product_supply.id
          exists = true if Integer(supply_id) == Integer(id)
        end
        if exists == false
          HasSupply.create(supply_id: supply_id, product_id: self.id )
        end
      end
    end
  end
end