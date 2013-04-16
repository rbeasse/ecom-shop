class Order < ActiveRecord::Base
  attr_accessible :client_id, :status, :hst, :pst, :gst
  validates :status, presence: true

  belongs_to :client
  has_many :ordered_products

  def total
  	self.ordered_products.inject(0.00) do |total, product|
  		total + (product.price * product.quantity)
  	end
  end
end
