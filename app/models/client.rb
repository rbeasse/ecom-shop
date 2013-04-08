class Client < ActiveRecord::Base
  attr_accessible :address, :city, :dob, :email, :name, :password, :phone, :postal_code, :province_id
  has_many :orders
  validates :address, :city, :dob, :email, :name, :password, :phone, :postal_code, :province_id, presence: true
  belongs_to :province
end
