class HasSponsor < ApplicationRecord
  belongs_to :order
  belongs_to :sponsor
end
