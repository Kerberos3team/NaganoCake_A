class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_details

  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { waiting: 0, paid:1, producting:2, preparing:3, sented:4 }

  validates :name, presence: true
  validates :postal_code, length: {is: 7 }, numericality: { only_integer: true }, presence: true
  validates :address, presence: true
  validate :address_must_contain_letters, if: -> { address.present? }
  
  def address_must_contain_letters
    if address.match?(/\A[0-9]+\z/)
      errors.add(:address, "は数字のみではなく文字を含めてください")
    end
  end  
end
