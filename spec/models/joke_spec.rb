require 'rails_helper'


describe Joke do
  let(:valid_attributes) {
    { lead: "What do you call a cow with no legs?", punchline: "Ground beef.." }
  }

  before(:each) {
    Joke.create(valid_attributes)
  }

  let(:category) {
    Joke.new(valid_attributes)
  }

  it "has a lead" do
    expect(category.lead).to eq("What do you call a cow with no legs?")
  end

  it "has a punchline" do
    expect(category.punchline).to eq("Ground beef..")
  end

  it "won't create a category without a lead" do
    category.lead = nil

    expect(category).to be_invalid
  end

  it "successfully adds a category to the database" do
    expect(category.lead).to eq("What do you call a cow with no legs?")
    expect(category.punchline).to eq("Ground beef..")
  end

  it "does not let a non unique category lead through" do
    category = Joke.new(valid_attributes)
    expect(category).to be_invalid
  end


end
