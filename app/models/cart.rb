class Cart
	
	attr_reader :items
	
	class CartItem
		attr_accessor :id, :quantity
		def initialize id, quantity
			@id = id
			@quantity = quantity
		end
	end

	def initialize
		@items = []
	end

  def add_item id
  	@items << CartItem.new(id, 1) if new_item?(id)
  end

  def flush
  	@items = []
  end

  def new_item? id
  	@items.each do | item |
    	if item.id == id
    		item.quantity += 1
    		return false
    	end
    end
    true
  end

end
