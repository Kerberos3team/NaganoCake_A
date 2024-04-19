class Item < ApplicationRecord

  belongs_to :genre
  has_many :cart_items

  has_one_attached :image

  validates :image, presence: true
  validates :name, presence: true
  validates :introduction, presence: true
  validates :genre_id, presence: true
  validates :is_active, inclusion: {in: [true, false]}


#税込価格の計算
  def with_tax_price
    (self.price * 1.1).floor
  end


  def self.search_for(content)
    Item.where('name LIKE ?', '%'+content+'%')
  end

  def image_convert_for_index
    image.variant( resize: "208" ).processed
  end

  def image_convert_for_show
    image.variant( resize: "304" ).processed
  end


end
