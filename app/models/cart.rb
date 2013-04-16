class Cart
	attr_reader :items

	def initialize
		@items = []
	end

  def add_item id
  	@items << CartItem.new(id, 1) if new_item?(id)
  end

  def empty
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
