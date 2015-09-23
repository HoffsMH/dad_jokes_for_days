require "rails_helper"

feature "Items page" do
  fixtures :categories
  fixtures :items

  it "can visit the items page" do
    visit "/"
    click_link "All Products"

    expect(current_path).to eq(items_path)
  end

  it "all items have titles" do
    visit "/"
    click_link "All Products"

    expect(page).to have_content("Item A")
    expect(page).to have_content("Item B")
    expect(page).to have_content("Item C")
  end

  it "all items have images" do
    visit "/"
    click_link "All Products"

    page.should have_xpath("//img[@src=\"http://domain.com/address1\"]")
    page.should have_xpath("//img[@src=\"http://domain.com/address2\"]")
    page.should have_xpath("//img[@src=\"http://domain.com/address3\"]")
  end

  xit "all items have prices" do
    visit "/"
    click_link "All Products"

    expect(page).to have_content("$11.11")
    expect(page).to have_content("$222.22")
    expect(page).to have_content("$3,333.33")
  end

  it "has an Add To Cart button" do
    visit "/"
    click_link "All Products"

    expect(page).to have_button("Add To Cart")
  end
end
