class Role < ApplicationRecord
  belongs_to :user
  belongs_to :blog

  validates :description, inclusion: { in: %w(owner collaborator admin) }
end
