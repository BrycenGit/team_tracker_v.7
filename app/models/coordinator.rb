class Coordinator < ApplicationRecord
  belongs_to :team
  has_many :players, dependent: :destroy
end