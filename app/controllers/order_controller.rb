class OrderController < ApplicationController
  def to_cart
  	@product_id = params[:id]
    @product = Product.find(@product_id)

    session[:cart] = [] if session[:cart].nil?

    product_exists = false

    session[:cart].each do | line_item |
    	if line_item.product == @product
    		line_item.quantity += 1
    		product_exists = true
    	end
    end
	  session[:cart] << OpenStruct.new({ product: @product, quantity: 1 }) unless product_exists
    redirect_to :back
  end

  def checkout
  	@items = session[:cart]
  end

  def invoice
  end
end
