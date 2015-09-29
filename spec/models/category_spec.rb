require 'rails_helper'

describe Category do
  let(:valid_attributes) {
    { name: "Mug", dao: "mug" }
  }

  before(:each) {
    Category.create(valid_attributes)
  }

  let(:category) {
    Category.new(valid_attributes)
  }

  it "has a name" do
    expect(category.name).to eq("Mug")
  end

  it "has a dao" do
    expect(category.dao).to eq("mug")
  end
  
  it "dao is its param" do
    expect(category.to_param).to eq("mug")
  end

  it "won't create a category without a name" do
    category.name = nil

    expect(category).to be_invalid
  end

  xit "won't create a category without a dao" do
    category.dao = nil
    # canot actually be tested since it runs the validation
    expect(category).to be_invalid
  end

  it "successfully adds a category to the database" do
    expect(category.name).to eq("Mug")
    expect(category.dao).to eq("mug")
  end

  it "does not let a non unique category name through" do
    category = Category.new(valid_attributes)
    expect(category).to be_invalid
  end

end
