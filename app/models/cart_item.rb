class CartItem
	attr_accessor :id, :quantity, :title

	def initialize id, quantity
		@id = id
		@quantity = quantity
		product = Product.find(@id)
		@title = product.title
	end
	
end