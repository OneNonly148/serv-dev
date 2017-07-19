class Booking < ApplicationRecord
  has_many :make
  has_many :model
  before_save {email.downcase!}
	validates :name, presence: true, length: {maximum: 50}
  validates :phone_no, presence: true
	validates :email, presence: true, length: {maximum: 255}
end
