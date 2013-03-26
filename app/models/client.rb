class Client < ActiveRecord::Base
  attr_accessible :address, :city, :country, :dob, :email, :name, :password, :phone, :postal_code, :province
  has_many :orders
end
