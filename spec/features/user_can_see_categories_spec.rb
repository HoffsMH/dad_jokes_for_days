require "rails_helper"

feature "A guest" do
  fixtures :categories

  it "can visit the categories page" do
    visit "/"
    click_link "All Categories"

    expect(current_path).to eq(categories_path)
  end

  it "can see all categories on the categories page" do
    visit "/"
    click_link "All Categories"

    expect(page).to have_content("Category A")
    expect(page).to have_content("Category B")
    expect(page).to have_content("Category C")
  end
end
