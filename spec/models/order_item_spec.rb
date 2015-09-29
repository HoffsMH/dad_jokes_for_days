require "rails_helper"

describe OrderItem, type: :model do
  let(:valid_attributes) {
    { item_id: 1, joke_id: 7, quantity: 2}
  }

  it "is valid" do
    order = OrderItem.new(valid_attributes)

    expect(order).to be_valid
  end

  it "is not valid without a item_id" do
    order_item = OrderItem.new(valid_attributes)
    order_item.item_id = nil

    expect(order_item).to be_invalid
  end

  it "is not valid without a joke_id" do
    order_item = OrderItem.new(valid_attributes)
    order_item.joke_id = nil

    expect(order_item).to be_invalid
  end

  it "is not valid without a quantity" do
    order_item = OrderItem.new(valid_attributes)
    order_item.quantity = nil

    expect(order_item).to be_invalid
  end
end
