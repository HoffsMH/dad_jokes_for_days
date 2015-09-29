require 'rails_helper'

describe Item do
  let(:valid_attributes) {
    { name: "mug mug", description: "100% ceramic", image_url: "wowow", dao: "mugmug", price: 10.23 }
  }

  let(:non_unique_attributes) {
    { name: "zug zug", description: "100% Ceramicc", image_url: "wowowow", dao: "zugzug", price: 10.23 }
  }

  before(:each) {
    Item.create(non_unique_attributes)
  }

  let(:item) {
    Item.new(valid_attributes)
  }

  it "has a name" do
    expect(item.name).to eq("mug mug")
  end

  it "has a description" do
    expect(item.description).to eq("100% ceramic")
  end

  it "has an image_url" do
    expect(item.image_url).to eq("wowow")
  end

  it "has a dao" do
    expect(item.dao).to eq("mugmug")
  end

  it "won't create an item without a name" do
    item.name = nil

    expect(item).to be_invalid
  end

  it "won't create a item without a description" do
    item.description = nil

    expect(item).to be_invalid
  end

  it "won't create an item without an image_url" do
    item.image_url = nil

    expect(item).to be_invalid
  end


  it "won't create an item without a price" do
    item.price = nil

    expect(item).to be_invalid
  end

  it "won't create an item without a dao" do
    item.dao = nil
    item.valid?
    expect(item.dao).to eq('mugmug')
  end

  it "successfully adds an item to the database" do
    expect(item.name).to eq("mug mug")
    expect(item.description).to eq("100% ceramic")
    expect(item.image_url).to eq("wowow")
    expect(item.dao).to eq("mugmug")
  end

  it "does not let a non unique item name through" do
    item = Item.new(non_unique_attributes)
    expect(item).to be_invalid
  end

end
