require 'rails_helper'

feature "update cart" do
  fixtures :categories
  fixtures :items
  fixtures :users

  context "Items are in the cart" do
    before(:each) do
      visit "/"
      click_link("All Products")
      first(:button, "Add To Cart").click
    end

    it "can update quantity" do
      fill_in "order_item[quantity]", with: "20"
      click_button "Update Quantity"
      expect(page).to have_selector("input[value='20']")
    end

    it "can delete item from cart" do
      fill_in "order_item[quantity]", with: "20"
      click_button "Remove"
      expect(page).not_to have_button("Remove")
    end

    it "upon deleting an item has a link to re add" do
      click_button "Remove"
      expect(page).to have_link("Item A")
    end
  end
end
