class Role < ApplicationRecord
  belongs_to :user
  has_one :blog

  validates :description, inclusion: { in: %w(owner guest) }
end
