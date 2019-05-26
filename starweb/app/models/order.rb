class Order < ApplicationRecord
  belongs_to :client
  has_many :has_sponsors
  has_many :sponsors, through: :has_sponsors
  has_many :has_products
  has_many :products, through: :has_products

  # Sponsors
  before_update :clear_sponsors
  before_destroy :clear_sponsors
  after_create :save_sponsors
  after_update :save_sponsors

  def sponsors=(value)
    @sponsors = value
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
end