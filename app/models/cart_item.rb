class Cart_item < SimpleDelegator
  attr_reader :quantity, :item
  def initialize(item, quantity)
    @quantity = quantity
    @item = Item.find_by_dao(item)
    super(@item)
  end

end
