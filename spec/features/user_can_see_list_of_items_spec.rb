require "rails_helper"

feature "Items page" do
  fixtures :categories
  fixtures :items

  it "can visit the items page" do
    visit "/"
    click_link "All Products"

    expect(current_path).to eq(items_path)
  end

  it "can see all items on the items page" do
    visit "/"
    click_link "All Products"

    expect(page).to have_content("Item A")
    expect(page).to have_content("Item B")
    expect(page).to have_content("Item C")
  end

  it "can see all add to cart buttons" do
    visit "/"
    click_link "All Products" 
    expect(page).to have_button("Add To Cart")
  end
end
