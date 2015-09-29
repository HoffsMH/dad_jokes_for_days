require "rails_helper"

feature "Item Page" do
  context "at items page" do
    before(:each) do
      visit "/"
      click_link("All Products")
    end

    it "displays a Description" do
      click_link "Item A"
      expect(page).to have_content("Description")
    end
    
    it "displays a add to Cart button" do
      click_link "Item A"
      expect(page).to have_button("Add To Cart")
    end
  end
end
