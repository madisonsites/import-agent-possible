class Agent < ApplicationRecord
  belongs_to :office
  has_one :office_mls, through: :office, source: :mls
end
