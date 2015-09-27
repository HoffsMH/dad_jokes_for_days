require 'rails_helper'

describe Order, type: :model do
  let(:valid_attributes) {
    { user_id: 1, status: "complete" }
  }

  it "is valid" do
    order = Order.new(valid_attributes)

    expect(order).to be_valid
  end

  it "is not valid without a user id" do
    order = Order.new(valid_attributes)
    order.user_id = nil

    expect(order).to be_invalid
  end

  it "is not valid without a status" do
    order = Order.new(valid_attributes)
    order.status = nil

    expect(order).to be_invalid
  end

end
