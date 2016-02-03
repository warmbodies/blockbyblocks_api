class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_create :set_access_token

  PARAMS = [:email, :password, :first_name, :last_name]

  private
    def set_access_token
      self.access_token = SecureRandom.urlsafe_base64
    end
end
