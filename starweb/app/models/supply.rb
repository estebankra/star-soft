class Supply < ApplicationRecord
	has_many :products, through: :has_supplies

	has_attached_file :image, styles: { medium: "600x300", thumb: "300x150", mini: "200x100" }
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

	def self.search(term)
		if term
			where("name ILIKE ?", "%#{term}%").order('id DESC')
		else
			order('id DESC')
		end
	end
end
