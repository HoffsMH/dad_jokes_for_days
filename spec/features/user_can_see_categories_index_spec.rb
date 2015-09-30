require 'rails_helper'

feature "Categories page - a guest" do
  fixtures :categories

  it "can visit the categories page" do
    visit "/"
    click_link "All Categories"

    expect(current_path).to eq(categories_path)
  end

  it "can see the name of each category" do
    visit "/"
    click_link "All Categories"

    expect(page).to have_content("Category A")
    expect(page).to have_content("Category B")
    expect(page).to have_content("Category C")
  end

  it "can see an image for each category" do
    visit "/"
    click_link "All Categories"

    expect(page).to have_xpath("//img[@src=\"/images/categorya.jpg\"]")
    expect(page).to have_xpath("//img[@src=\"/images/categoryb.jpg\"]")
    expect(page).to have_xpath("//img[@src=\"/images/categoryc.jpg\"]")
  end
end
