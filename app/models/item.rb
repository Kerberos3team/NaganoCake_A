class Item < ApplicationRecord

  belongs_to :genre, optional: true
  has_many :cart_items

  has_one_attached :image

  validates :image, presence: true
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :genre_id, presence: true
  validates :is_active, inclusion: {in: [true, false]}

  def with_tax_price
    (self.price * 1.1).floor
  end

  def self.search_for(content)
    if content == ""
      Item.all
    else
      Item.where('name LIKE ?', '%'+content+'%')
    end
  end

  def image_convert_for_index
    image.variant( resize: "208" ).processed
  end

  def image_convert_for_show
    image.variant( resize: "304" ).processed
  end

end
