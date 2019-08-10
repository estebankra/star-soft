class Client < ApplicationRecord
	has_many :order
	has_many :end_user_invoice

	# Validation
	validates  :first_name, :last_name, :doc_ruc, :phone, presence: true
	validates :first_name, :last_name, length: { minimum: 2, maximum: 40 }
  validates :email, :doc_ruc, :phone, length: { minimun: 10, maximum: 50 }
	validates :phone, numericality: true
end