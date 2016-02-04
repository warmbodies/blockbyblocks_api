class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_create :set_access_token
  before_create :set_gravatar_url

  has_many :appointments
  has_many :bookies, through: :appointments

  PARAMS = [:email, :password, :first_name, :last_name, :username, :phone, :remind_via_email, :remind_via_phone]

  validates :username, :first_name, :last_name, presence: true

  private
    def set_access_token
      self.access_token = SecureRandom.urlsafe_base64
    end

    def set_gravatar_url
      # include MD5 gem, should be part of standard ruby install
      require 'digest/md5'

      # get the email from URL-parameters or what have you and make lowercase
      email_address = self.email.downcase

      # create the md5 hash
      hash = Digest::MD5.hexdigest(email_address)

      # compile URL which can be used in <img src="RIGHT_HERE"...
      image_src = "http://www.gravatar.com/avatar/#{hash}"

      self.gravatar_url = image_src
    end
end
