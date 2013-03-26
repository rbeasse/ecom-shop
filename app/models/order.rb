class Order < ActiveRecord::Base
  attr_accessible :client_id, :status
  belongs_to :client
  has_many :ordered_products
end
