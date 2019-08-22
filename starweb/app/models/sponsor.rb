class Sponsor < ApplicationRecord
  has_many :orders, through: :has_sponsors, dependent: :destroy

  has_attached_file :image, styles: { medium: "600x300", thumb: "300x150", mini: "200x100" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  # Validation
  validates :name, :image, presence: true
  validates :name, length: { in: 2..100 }
end
