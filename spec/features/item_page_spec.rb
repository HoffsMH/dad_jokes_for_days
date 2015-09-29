require "rails_helper"

feature "Item Page" do
  context "at items page" do
    before(:each) do
      visit "/"
      click_link("All Products")
    end
    
    it "displays a Description" do
      expect(page).to have_content("")
    end
    
  end
end