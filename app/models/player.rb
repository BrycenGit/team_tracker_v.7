class Player < ApplicationRecord
  belongs_to :coordinator
  has_one :team, through: :coordinator
end