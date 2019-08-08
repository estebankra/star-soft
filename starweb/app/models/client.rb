class Client < ApplicationRecord
	has_many :order
	has_many :end_user_invoice
end
