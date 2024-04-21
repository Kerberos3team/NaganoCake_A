class Address < ApplicationRecord

  belongs_to :customer


  def address_display
    '〒' + postal_code + ' ' + address + '　' + name
  end

  validates :postal_code, length: {is: 7 }, numericality: { only_integer: true }, presence: true
  validates :name, presence: true
  validates :address, presence: true
  validate :address_must_contain_letters, if: -> { address.present? }

  def address_must_contain_letters
    if address.match?(/\A[0-9]+\z/)
      errors.add(:address, "は数字のみではなく文字を含めてください")
    end
  end
end
