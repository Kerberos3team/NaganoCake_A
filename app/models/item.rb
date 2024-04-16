class Item < ApplicationRecord

  belongs_to :genre
  has_many :cart_items

  has_one_attached :image

  validates :image, presence: true
  validates :name, presence: true
  validates :introduction, presence: true
  validates :genre_id, presence: true
  validates :is_active, inclusion: {in: [true, false]}

  def price_with_tax
    tax_included_price = self.price * 1.1
    return tax_included_price.to_i
  end


end
