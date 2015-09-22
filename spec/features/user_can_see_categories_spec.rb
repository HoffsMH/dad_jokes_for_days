require "rails_helper"

feature "A guest" do
  it "can visit the categories page" do
    click_link "All Categories"
    expect(current_path).to eq(categories_path)
  end

  it "can see all categories on the categories page" do
    click_link "All Categories"
    expect(page).to have_content("Category A")
    expect(page).to have_content("Category B")
    expect(page).to have_content("Category C")
  end
end
