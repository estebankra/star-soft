class HasProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product

  
  has_attached_file :logo, styles: { medium: "600x300", thumb: "300x150", mini: "200x100" }
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/
end
