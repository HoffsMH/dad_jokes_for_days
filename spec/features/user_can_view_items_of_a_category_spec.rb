require 'rails_helper'

feature "category items" do
  fixtures :categories
  fixtures :items

  let(:category) { Category.find_by_name("Category B") }

  before(:each) do
    visit "/"
    click_link category.name
  end

  it "can visit a category page" do
    expect(current_path).to eq(category.dao.prepend("/"))
  end

  it "can see only the items for the category" do
    expect(page).to have_content("Item B")
    expect(page).to have_content("Item C")
  end
end
