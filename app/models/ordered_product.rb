class OrderedProduct < ActiveRecord::Base
  attr_accessible :order_id, :price, :product_id, :quantity
  validates :price, :product_id, :quantity, presence: true
  belongs_to :order
  belongs_to :product
end
