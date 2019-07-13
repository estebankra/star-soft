class Sponsor < ApplicationRecord
  has_many :orders, through: :has_sponsors

  has_attached_file :image, styles: { medium: "600x300", thumb: "300x150", mini: "200x100" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  
  # For search
  def self.search(term)
    if term
      where("name LIKE ?", "%#{term}%").order('id DESC')
    else
      order('id DESC')
    end
  end
end
