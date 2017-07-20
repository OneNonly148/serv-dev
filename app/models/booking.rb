class Booking < ApplicationRecord
  # has_many :make
  has_one :model
  before_save {email.downcase!}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :name, presence: true, length: {maximum: 50}
  validates :phone_no, presence: true
	validates :email, presence: true, length: {maximum: 255}, format: {with: VALID_EMAIL_REGEX}
end
