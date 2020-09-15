class Organization < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :user
  has_many :teams, dependent: :destroy

  validates :name, presence: true, length: { minimum: 2 }

  accepts_nested_attributes_for :teams, allow_destroy: true
end
