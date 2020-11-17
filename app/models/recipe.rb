class Recipe < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :cuisine
    validates :foodstuff
  end
end
