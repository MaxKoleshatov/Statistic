class Achievement < ApplicationRecord
  has_many :achievements_players, dependent: :destroy

  validates :title, presence: true
end
