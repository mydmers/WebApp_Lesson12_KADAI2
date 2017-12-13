class Micropost < ApplicationRecord
  has_many :favorite_users, through: :reverses_of_favorite, source: :user
  has_many :reverses_of_favorite, class_name:'favorite', foreign_key: :'micropost_id'
  
  belongs_to :user
  
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 255 }
end
