class OrderController < ApplicationController
  def to_cart
    session[:cart] ||= Cart.new
    session[:cart].add_item params[:id]
    redirect_to :back
  end

  def checkout
  	@items = session[:cart].items
    @cart = session[:cart]
    @subtotal = 0
    @provinces = Province.all.collect{|p| [ p.title, p.id ] }
  end

  def invoice

    cart = session[:cart]
    province = Province.find(params[:provinces])

    @customer = Client.new
    @customer.name = params[:first_name] + " " + params[:last_name] 
    @customer.address = params[:address]
    @customer.city = params[:city]
    @customer.province = province

    unless @customer.save
      redirect_to root_path, notice: "Please enter all the fields!"
      return
    end

    @order = Order.new
    @order.status = "UNPAID"
    @order.gst = province.gst
    @order.pst = province.pst
    @order.hst = province.hst
    @order.client = @customer

    @ordered_items = []
    cart.items.each do |item|
      ordered_item = OrderedProduct.new
      product = Product.find(item.id)
      ordered_item.product = product
      ordered_item.order = @order
      ordered_item.quantity = item.quantity
      ordered_item.price = product.price
      @ordered_items << ordered_item
      ordered_item.save
    end

    @pst_value ||= 0
    @hst_value ||= 0
    @gst_value ||= 0

    @total = @order.total
    @hst_value = (@total * (@order.hst / 100)).round(2) unless @order.hst.nil?
    @pst_value = (@total * (@order.pst / 100)).round(2) unless @order.pst.nil?
    @gst_value = (@total * (@order.gst / 100)).round(2) unless @order.gst.nil?

    @grand_total = @total + @pst_value + @gst_value + @hst_value 

    ActiveMerchant::Billing::Base.mode = :test

    gateway = ActiveMerchant::Billing::PaypalGateway.new(
      :login => "ryanbeasse_api1.gmail.com",
      :password => "1366079373",
      :signature => "AsxssMI.Gh8UZ9dTNM.i80KDJRUcA9ZftFRdCDWkQvNSioO4TZpoMWu4"
    )

    credit_card = ActiveMerchant::Billing::CreditCard.new(
      :brand              => params[:brand],
      :number             => params[:number],
      :verification_value => params[:verification_value],
      :month              => params[:month],
      :year               => params[:year],
      :first_name         => params[:first_name],
      :last_name          => params[:last_name]
    )

    if credit_card.valid?
      response = gateway.authorize((@grand_total.to_i * 100), credit_card, :ip => "127.0.0.1")
      if response.success?
        gateway.capture((@grand_total.to_i * 100), response.authorization)
      else
        redirect_to root_path, notice: "#{response.message}"
        return
      end
    else
      redirect_to root_path, notice: "Error: credit card is not valid. #{credit_card.errors.full_messages.join('. ')}"
      return
    end
    cart.empty  
    @order.status = "PAID"
    @order.save
  end
  def delete
    session[:cart].remove_item(params[:id])
    redirect_to checkout_path
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

