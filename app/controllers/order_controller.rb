class OrderController < ApplicationController
  def to_cart
    session[:cart] ||= Cart.new
    session[:cart].add_item params[:id]
    redirect_to :back
  end

  def checkout
  	@items = session[:cart].items
    @subtotal = 0
    @provinces = Province.all.collect{|p| [ p.title, p.id ] }
  end

  def purchase

    cart = session[:cart]
    province = Province.find(params[:provinces])

    customer = Client.new
    customer.name = params[:first_name] + " " + params[:last_name] 
    customer.address = params[:address]
    customer.city = params[:city]
    customer.province = province

    order = Order.new
    order.status = "BEING PROCESSED"
    order.gst = province.gst
    order.pst = province.pst
    order.hst = province.hst
    order.client = customer

    cart.items.each do |item|
      ordered_item = OrderedProduct.new
      product = Product.find(item.id)
      ordered_item.product = product
      ordered_item.order = order
      ordered_item.quantity = product.quantity
      ordered_item.price = product.price
      ordered_item.save
    end

    if customer.save && order.save
      cart.flush
      redirect_to root_path, notice: 'Cool' 
    else
      redirect_to checkout_path, notice: 'Errtor' 
    end

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

