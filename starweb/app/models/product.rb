class Product < ApplicationRecord
	has_and_belongs_to_many :supplies
	has_and_belongs_to_many :colors

	has_attached_file :image, styles: { medium: "600x300", thumb: "300x150", mini: "200x100" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end