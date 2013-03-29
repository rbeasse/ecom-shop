class OrderController < ApplicationController
  def to_cart
  	@product_id = params[:id]
    @product = Product.find(@product_id)
    session[:cart] = [] if session[:cart].nil?
		session[:cart] << @product
    redirect_to :back
  end

  def checkout
  end

  def invoice
  end
end
