class OrderController < ApplicationController
  def to_cart
    session[:cart] ||= Cart.new
    session[:cart].add_item params[:id]
    redirect_to :back
  end

  def checkout
  	@items = session[:cart].items
    @subtotal = 0
  end

  def invoice
    @items = session[:cart].items
    @running_total = 0
  end
end

# Where should this go?!
class Float
  def currency
    sprintf("$%.2f", self)
  end
  def percent
    sprintf("%.2f%", self)
  end
end

