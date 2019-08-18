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
  # before_update :clear_sponsors
  before_destroy :clear_sponsors
  after_create :save_sponsors
  after_update :save_sponsors

  has_attached_file :logo, styles: { medium: "600x300", thumb: "300x150", mini: "200x100" }
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/

  include ReportsKit::Model
  reports_kit do
    contextual_filter :for_client, ->(relation, context_params) { relation.where(client_id: context_params[:client_id]) }
  end

  STATUSES = %w[draft private published].freeze

  def to_s
    title
  end

  def sponsors=(value)
    @sponsors = value
  end

  def save_sponsors
    if @sponsors.nil?
      return
    else
      @sponsors.each do |sponsor_id|
        exists = false
        self.sponsors.each do |order_sponsor|
          id = order_sponsor.id
          exists = true if Integer(sponsor_id) == Integer(id)
        end
        if exists == false
          HasSponsor.create(order_id: self.id, sponsor_id: sponsor_id )
        end
      end
    end
  end

  def clear_sponsors
    HasSponsor.all.each do | hasSponsor |
      HasSponsor.destroy(hasSponsor.id) if hasSponsor.order_id == self.id
    end
  end
end