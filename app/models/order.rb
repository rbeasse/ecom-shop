class Order < ActiveRecord::Base
  attr_accessible :client_id, :status
  validates :status, :client_id, presence: true

  belongs_to :client
  has_many :ordered_products
end
