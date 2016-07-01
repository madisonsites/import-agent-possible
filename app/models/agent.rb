class Agent < ApplicationRecord
  belongs_to :office
  delegate :mls, to: :office, prefix: true, allow_nil: true
end
