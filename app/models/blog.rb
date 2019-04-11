class Blog < ApplicationRecord
  has_many :roles
  has_many :users, through: :roles

  accepts_nested_attributes_for :roles

  before_save :set_hidden

  scope :public_blogs, -> { where(hidden: false) }

  private

  def set_hidden
    if hidden == 1
      hidden = true
    elsif hidden = 0
      hidden = false || nil
    end
  end 

end
