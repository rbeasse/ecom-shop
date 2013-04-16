class ProductsController < ApplicationController
	def view
		@product = Product.find(params[:id])
	end
end