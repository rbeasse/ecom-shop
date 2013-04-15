class Order < ActiveRecord::Base
  attr_accessible :client_id, :status, :hst, :pst, :gst
  validates :status, presence: true

  belongs_to :client
  has_many :ordered_products
end
