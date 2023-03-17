module CartsHelper
  def	property_name(cart)
    @types = Property.find(cart.property_id)
    @types.property_type
  end

  def	property_price(cart)
    @types = Property.find(cart.property_id)
    @types.price
  end

  def	property_city(cart)
    @types = Property.find(cart.property_id)
    @types.city
  end

  def	property_address(cart)
    @types = Property.find(cart.property_id)
    @types.address
  end

  def property_seller(cart)
    @seller = Property.find(cart.property_id)
    @seller.id
  end
end
