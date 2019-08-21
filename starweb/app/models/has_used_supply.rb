class HasUsedSupply < ApplicationRecord
  belongs_to :order
  belongs_to :supply

  def supplies=(value)
    @supplies = value
  end

  def orders=(value)
    @order_id = value
  end

  # Discount stock of supplies
  def discount_stock
    if @supplies.nil?
    else
      @supplies.each do |sub_array|
        sub_array.each do |item|
          id_supply = item[0]
          quantity = item[1]

          # For history of supplies used in an order
          HasUsedSupply.create(order_id: @order_id, supply_id: id_supply,
                               quantity: quantity)

          # Update supply with the new stock
          @supply = Supply.find(id_supply)
          new_stock = @supply.stock - Integer(quantity)
          @supply.update(:stock => new_stock)
        end
      end
    end
  end
end
