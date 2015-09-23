require "rails_helper"

feature "when I visit home page" do
  fixtures :jokes

  it "has a link to pick a random joke" do
    visit "/"
    click_link "Pick a joke for me!"
    expect(current_path).to eq(items_path)
    
  end

end
