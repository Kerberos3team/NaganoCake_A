class Order < ApplicationRecord
  
  belongs_to :customer
  has_many :order_details
  
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { waiting: 0, paid:1, producting:2, preparing:3, sented:4 }
  
end
