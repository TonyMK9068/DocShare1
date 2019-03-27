class Blog < ApplicationRecord
  has_many :roles

  scope :public_blogs, -> { where(private: false) }

end
