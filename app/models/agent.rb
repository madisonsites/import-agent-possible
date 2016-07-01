class Agent < ApplicationRecord
  validates :mls, presence: true, uniqueness: true
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  belongs_to :office
  delegate :mls, to: :office, prefix: true, allow_nil: true
end
