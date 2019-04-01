class Blog < ApplicationRecord
  has_many :roles
  has_many :users, through: :roles

  accepts_nested_attributes_for :roles

  scope :public_blogs, -> { where(private: false) }

end
