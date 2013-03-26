class Vendor < ActiveRecord::Base
  attr_accessible :contact, :title, :website
  has_many :products
end
