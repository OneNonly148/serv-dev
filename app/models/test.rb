class Test < ApplicationRecord
  has_one make
  has_one location
  has_one Package
end
