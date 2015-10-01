require 'rails_helper'

feature "orders" do
  before(:each) do
    visit "/"
  end

  context "when logged in" do
    before(:each) do
      visit "/"
      click_link "Login"
      fill_in "Email", with: "jeff@gmail.com"
      fill_in "Password", with: "pass"
      click_button("Login")
    end

    it "Redirects to Dashboard" do
      visit "/"
      click_link "All Products"
      first(:button, "Add To Cart").click
      expect(current_path).to eq("/cart")
      click_link "Checkout"
      click_button "Confirm"
      expect(current_path).to eq("/dashboard")
    end

    it "Creates the Order" do
      visit "/"
      click_link "All Products"
      first(:button, "Add To Cart").click
      expect(current_path).to eq("/cart")
      click_link "Checkout"
      click_button "Confirm"
      expect(page).to have_content("Invoice #")
    end
  end
end
