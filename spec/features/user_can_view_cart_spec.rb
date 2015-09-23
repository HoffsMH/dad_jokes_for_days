require "rails_helper"

feature "cart" do
  fixtures :categories
  fixtures :items
  fixtures :cart

  let(:cart) { Category.find(1) }

  before(:each) do
    visit "/"
    click_link 'Cart'
  end

  xit "can visit the cart page" do
    expect(current_path).to eq('/cart')
  end

  xit "can see items in the cart" do
    expect(page).to have_content("Item B")
    expect(page).to have_content("Item C")
  end
end
