class HasSupply < ApplicationRecord
  belongs_to :product
  belongs_to :supply

  delegate :name, :image, :description, to: :supply, prefix: true
end
