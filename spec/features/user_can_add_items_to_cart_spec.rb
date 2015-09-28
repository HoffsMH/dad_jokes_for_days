require "rails_helper"

feature "cart" do
  fixtures :categories
  fixtures :items
  fixtures :users

  before(:each) do
    visit "/"
  end

  it "can visit the cart page" do
    click_link("Cart")
    expect(current_path).to eq('/cart')
  end

  it "can add items" do
    click_link("All Products")
    first(:button, "Add To Cart").click
    expect(current_path).to eq('/cart')
    expect(page).to have_content("Item A")
    expect(page).to have_content("$11.11")
  end

  context "user is logged in" do
    before(:each) {
      visit '/login'
      fill_in "Email", with: "jeff@gmail.com"
      fill_in "Password", with: "pass"
      click_button("Login")
    }

    it "can checkout to buy items" do
      click_link("All Products")
      first(:button, "Add To Cart").click
      click_button("Checkout")

      expect(current_path).to eq("/checkout")
    end
  end

  context "user is not logged in" do

    it "must log in before checking out" do
      visit '/'
      click_link("All Products")
      first(:button, "Add To Cart").click

      
      expect(page).to have_content("You must log in before checking out")
      expect(page).to have_content("Login")
      expect(page).not_to have_content("Checkout")
    end

    it "can log in and proceed to checkout" do
      visit '/'
      click_link("All Products")
      first(:button, "Add To Cart").click
      within(:css, ".cart-right") do
        click_link("Login")
      end
      expect(current_path).to eq("/login")
      fill_in "Email", with: "jeff@gmail.com"
      fill_in "Password", with: "pass"
      click_button("Login")
      expect(current_path).to eq("/cart")
    end
  end

  # xit "user adds multiple items to cart and tries to buy"

end
