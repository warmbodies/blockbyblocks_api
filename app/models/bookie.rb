class Bookie < ActiveRecord::Base
  has_many :appointments
  has_many :users, through: :appointments

  validates :name, :email, :phone, presence: true
  validates :email, :phone, uniqueness: true  # TODO: add phone number format validation?
  validates :email, format: { with: /\A.*@.*\z/, message: "is invalid" }
end
