class Recipe < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :cuisine
    validates :foodstuff
  end

  def self.search(search)
    if search != ""
      Recipe.where('foodstuff LIKE(?)', "%#{search}%")
    else
      Recipe.all
    end
  end
end
