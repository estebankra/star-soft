class Supply < ApplicationRecord
	has_many :has_supplies
	has_many :products, through: :has_supplies
end
