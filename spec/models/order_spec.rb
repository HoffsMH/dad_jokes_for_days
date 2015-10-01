require "rails_helper"

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

  it "has a quantity method" do
    order = Order.new(valid_attributes)
    expect(order).to respond_to(:quantity)
    expect(order.quantity).to be_a(Fixnum)
  end

  it "has a total method" do
    order = Order.new(valid_attributes)
    expect(order.total).to be_a(Fixnum)
  end

end
