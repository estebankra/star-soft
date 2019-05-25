class Supply < ApplicationRecord
	has_many :products, through: :has_supplies
end
