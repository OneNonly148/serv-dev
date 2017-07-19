class Make < ApplicationRecord
  belongs_to :booking
  has_many :model
end
