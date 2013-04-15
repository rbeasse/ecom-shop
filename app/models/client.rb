class Client < ActiveRecord::Base
  attr_accessible :address, :city, :name, :province_id
  has_many :orders
  validates :address, :city, :name, :province_id, presence: true
  belongs_to :province
end
