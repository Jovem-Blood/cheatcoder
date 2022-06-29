class Week < ApplicationRecord
  has_many :codes, dependent: :destroy
end
