class Make < ApplicationRecord
    has_many :model, dependent: :destroy
end
