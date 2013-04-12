class Client < ActiveRecord::Base
  attr_accessible :address, :email, :name, :province_id
  has_many :orders
  validates :address, :city, :dob, :email, :name, :password, :phone, :postal_code, presence: true
  belongs_to :province
end
