class CartItem < ApplicationRecord

  belongs_to :customer
  belongs_to :item

  validates :amount, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 10}

  def subtotal
    item.with_tax_price * amount
  end
  
end
