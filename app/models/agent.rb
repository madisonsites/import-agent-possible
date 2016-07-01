class Agent < ApplicationRecord
  validates :mls, presence: true, uniqueness: true
  # TIL about custom validators; using this instead of format: to allow for adding in bad domains like mailinator
  validates :email, presence: true, email: true
  belongs_to :office
  delegate :mls, to: :office, prefix: true, allow_nil: true
end
