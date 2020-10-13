class Team < ApplicationRecord
  has_one :coordinator, dependent: :destroy
  has_many :players, through: :coordinator, dependent: :destroy
end