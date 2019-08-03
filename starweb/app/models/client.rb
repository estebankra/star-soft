class Client < ApplicationRecord
	has_many :order

	def self.search(term)
		if term
		  where("CONCAT_WS(' ', firstname, lastname, doc_ruc)  ILIKE ?", "%#{term}%").order('id DESC')
		else
		  order('id DESC')
		end
	end
end
