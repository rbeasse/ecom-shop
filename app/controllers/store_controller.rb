class StoreController < ApplicationController
  def index
  	@new_products = Product.limit(5)
  end

  def search
  	@product_searched_for = params[:product]
  	@products = Product.where("title LIKE '%#{@product_searched_for}%'")
  end

  def category
  	@category_id = params[:id]
  	@products = Product.where(category_id: @category_id)
  	@category = Category.find(@category_id)
  end

  def view
  end
end
