class Order < ApplicationRecord
  # Relations
  belongs_to :client
  delegate :first_name, :last_name, :doc_ruc, to: :client, prefix: true
  has_many :has_sponsors
  has_many :sponsors, through: :has_sponsors
  has_many :has_products
  has_many :products, through: :has_products
  has_many :has_details
  has_many :order_details, through: :has_details

  # Validations
  validates :course_club, :logo, :deliver_date, presence: true
  validates :course_club, length: { maximum: 50 }
  validates :notes, length: { maximum: 300 }

  # Sponsors
  before_update :clear_sponsors
  before_destroy :clear_sponsors
  after_create :save_sponsors
  after_update :save_sponsors

  has_attached_file :logo, styles: { medium: "600x300", thumb: "300x150", mini: "200x100" }
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/

  def sponsors=(value)
    @sponsors = value
  end

  def save_sponsors
    if @sponsors.nil?
      return
    else
      @sponsors.each do |sponsor_id|
        HasSponsor.create(order_id: self.id, sponsor_id: sponsor_id )
      end
    end
  end

  def clear_sponsors
    HasSponsor.all.each do | hasSponsor |
      if hasSponsor.order_id == self.id
        HasSponsor.destroy(hasSponsor.id)
      end
    end
  end
end