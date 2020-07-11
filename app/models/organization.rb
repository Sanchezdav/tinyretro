class Organization < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :user

  validates :name, presence: true, length: { minimum: 2 }
end
