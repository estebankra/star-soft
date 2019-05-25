class Order < ApplicationRecord
  belongs_to :client
  has_many :has_sponsors
  has_many :sponsors, through: :has_sponsors
  has_many :has_products
  has_many :products, through: :has_products
  has_many :has_details
  has_many :order_details, through: :has_details


  # Sponsors
  before_update :clear_sponsors
  before_destroy :clear_sponsors
  after_create :save_sponsors
  after_update :save_sponsors

  # Products
  #before_update :clear_products
  #before_destroy :clear_products
  #after_create :save_products
  #after_update :save_products

  def sponsors=(value)
    @sponsors = value
  end

  def order_details=(value)
    @order_details = value
  end

  def products=(value)
    @products = value
  end
  
  def save_sponsors
    @sponsors.each do |sponsor_id|
      HasSponsor.create(order_id: self.id, sponsor_id: sponsor_id )
    end
  end

  def clear_sponsors 
    HasSponsor.all.each do | hasSponsor |
      if hasSponsor.order_id == self.id
        HasSponsor.destroy(hasSponsor.id)
      end
    end
  end

  def save_products
    @products.each do |product_id|
      HasProduct.create(order_id: self.id, product_id: product_id )
    end
  end

  def clear_products 
    HasProduct.all.each do | hasProduct |
      if hasProduct.order_id == self.id
        HasProduct.destroy(hasProduct.id)
      end
    end
  end
end