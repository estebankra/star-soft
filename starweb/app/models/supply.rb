class Supply < ApplicationRecord
	has_many :products, through: :has_supplies
	has_many :orders, through: :has_used_supplies

	has_attached_file :image, styles: { medium: "600x300", thumb: "300x150", mini: "200x100" }
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

	# Validation
	validates :name, :image, :stock,  presence: true
	validates :name, length: { in: 3..100 }
	validates :description, length: { maximum: 200 }
end
