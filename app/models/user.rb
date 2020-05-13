class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable,
         :recoverable, :rememberable, :validatable

  include PermissionsConcern

  # Validation
  validates :first_name, :last_name, :email, presence: true
  validates :first_name, :last_name, :email, length: { maximum: 100 }
  # Relation

  def full_name
    "#{first_name} #{last_name}"
  end
end
