require "rails_helper"

feature "Remove Cart" do
  context "Items are in the cart" do
    before(:each) do
      visit "/"
      click_link("All Products")
      first(:button, "Add To Cart").click
    end

    it "will redirect to cart" do
      click_link "Delete Cart"
      expect(current_path).to eq("/cart")
    end

    it "will remove Cart" do
      click_link "Delete Cart"
      expect(page).not_to have_content("Delete Cart")
    end
  end
end
