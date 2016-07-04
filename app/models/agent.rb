class Agent < ApplicationRecord
  include ActiveModel::Validations
  include ActiveModel::Validations::Callbacks
  include TextCleaner

  attr_accessor :description
  belongs_to :office, optional: true

  validates :mls, uniqueness: true, allow_nil: true
  validates :email, uniqueness: true, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  before_validation :clean_description

  delegate :mls, to: :office, prefix: true, allow_nil: true

  private

  def clean_description
    if @description.present?
      @description = escape_html(remove_html_tags(@description))
    end
  end

end
