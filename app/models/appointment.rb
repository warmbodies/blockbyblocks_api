class Appointment < ActiveRecord::Base
  belongs_to :user
  belongs_to :bookie

  validates :user_id, :bookie_id, :time, :bookie_note, presence: true
end
