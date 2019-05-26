class OrderDetail < ApplicationRecord
  has_many :has_details
  has_many :orders, through: :has_details


  # Order Details
  before_update :clear_order_details
  before_destroy :clear_order_details
  after_create :save_order_details
  after_update :save_order_details


  def order_id=(value)
    @order_id = value
  end

  def save_order_details
      HasDetail.create(order_detail_id: self.id, order_id: @order_id)
  end

  def clear_order_details 
    HasDetail.all.each do | hasDetail |
      if hasDetail.order_id == self.id
        HasDetail.destroy(hasDetail)
      end
    end
  end
end