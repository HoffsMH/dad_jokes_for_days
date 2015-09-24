class CartItem < SimpleDelegator
  attr_reader :quantity, :item
  def initialize(item, quantity)
    @quantity = quantity
    @item = Item.find_by_dao(item)
    super(@item)
  end

  def total
    price * @quantity
  end

  def to_param
    @item.id
  end

end
