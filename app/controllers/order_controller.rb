class OrderController < ApplicationController
  def to_cart
    session[:cart] ||= Cart.new
    session[:cart].add_item params[:id]
    redirect_to :back
  end

  def checkout
  	@items = session[:cart].items
  end

  def invoice
  end
end
