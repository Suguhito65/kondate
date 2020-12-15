class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :recipes
  has_many :favorites, dependent: :destroy
  has_many :comments
  
  validates :name, presence: true

  def already_favorited?(recipe)
    self.favorites.exists?(recipe_id: recipe.id)
  end
end
