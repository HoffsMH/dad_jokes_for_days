require "rails_helper"

feature "Items page - a guest" do
  fixtures :categories
  fixtures :items

  it "can visit the items page" do
    visit "/"
    click_link "All Products"

    expect(current_path).to eq(items_path)
  end

  it "can see the name of each item" do
    visit "/"
    click_link "All Products"

    expect(page).to have_content("Item A")
    expect(page).to have_content("Item B")
    expect(page).to have_content("Item C")
  end

  it "can see an image for each item" do
    visit "/"
    click_link "All Products"

    page.should have_xpath("//img[@src=\"/images/itema.jpg\"]")
    page.should have_xpath("//img[@src=\"/images/itemb.jpg\"]")
    page.should have_xpath("//img[@src=\"/images/itemc.jpg\"]")
  end

  it "can see a price for each item" do
    visit "/"
    click_link "All Products"

    expect(page).to have_content("$11.11")
    expect(page).to have_content("$222.22")
    expect(page).to have_content("$3,333.33")
  end

  it "can see an Add To Cart button" do
    visit "/"
    click_link "All Products"

    expect(page).to have_button("Add To Cart")
  end
end
