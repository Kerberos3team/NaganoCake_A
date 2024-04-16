class Item < ApplicationRecord

  belongs_to :genre
  has_many :cart_items

  has_one_attached :image
  
  validates :image, presence: true
  validates :name, presence: true
  validates :introduction, presence: true
  validates :genre_id, presence: true
  validates :status, presence: true
  
end
