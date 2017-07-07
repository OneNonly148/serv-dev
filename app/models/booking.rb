class Booking < ApplicationRecord
	validates :name, presence: true
	#VALID_PHONE_REGEX
	validates :phone_no, presence: true
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}
	validates :booking_date, presence: true
	validates :booking_ses, presence: true
	validates :serv_loc, presence: true
	validates :car_make, presence: true
end
