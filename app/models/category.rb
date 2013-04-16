class Category < ActiveRecord::Base
  attr_accessible :description, :title
  has_many :products
  validates :title, presence: true
end
