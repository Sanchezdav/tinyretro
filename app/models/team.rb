class Team < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :organization

  validates :name, presence: true, length: { minimum: 2 }
end
