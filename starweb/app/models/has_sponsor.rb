class HasSponsor < ApplicationRecord
  belongs_to :order, dependent: :destroy
  belongs_to :sponsor, dependent: :destroy
end
