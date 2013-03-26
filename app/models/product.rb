class Product < ActiveRecord::Base
  attr_accessible :category_id, :description, :model_number, :price, :quantity, :title, :vendor_id, :weight
  belongs_to :vendor
  belongs_to :category
end
