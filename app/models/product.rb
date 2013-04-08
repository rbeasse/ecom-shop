class Product < ActiveRecord::Base
  attr_accessible :category_id, :description, :model_number, :price, :quantity, :title, :vendor_id, :weight
  validates :description, :model_number, :price, :quantity, :title, :vendor_id, :weight, presence: true
  belongs_to :vendor
  belongs_to :category
end
