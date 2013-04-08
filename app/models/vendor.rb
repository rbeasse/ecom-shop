class Vendor < ActiveRecord::Base
  attr_accessible :contact, :title, :website
  validates :contact, :title, :website, presence: true
  has_many :products
end
