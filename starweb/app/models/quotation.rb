class Quotation < ApplicationRecord
	belongs_to :currency
	delegate :name, :to => :currency, :prefix => true
end
