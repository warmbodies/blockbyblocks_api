class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_create :set_access_token

  has_many :appointments
  has_many :bookies, through: :appointments

  PARAMS = [:email, :password, :first_name, :last_name, :username, :phone, :remind_via_email, :remind_via_phone]

  validates :username, :first_name, :last_name, presence: true

  private
    def set_access_token
      self.access_token = SecureRandom.urlsafe_base64
    end
end
