class Category < ActiveRecord::Base
  attr_accessible :description, :title
  has_many :products
  validates :title, :description, presence: true

end
