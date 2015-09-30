require "rails_helper"

feature "admin items page" do
  fixtures :items
  fixtures :users
  fixtures :jokes
  fixtures :categories

  context "as an unauthenticated user" do
    before(:each) do
      visit "/admin/items"
    end
    it "returns not found page" do
      expect(page).to have_content(404)
      expect(page).not_to have_content("Admin Items")
    end
    it "404s" do
      expect(page.status_code).to eq(404)
    end
  end

  context "as an normal authenticated user" do
    before(:each) do
      visit "/"
      click_link("Login")
      fill_in("Email", with: "jeff@gmail.com")
      fill_in("Password", with: "pass")
      click_button "Login"
      visit "/admin/items"
    end
    it "returns not found page" do
      expect(page).to have_content(404)
      expect(page).not_to have_content("Admin Items")
    end
    it "404s" do
      expect(page.status_code).to eq(404)
    end
  end

  context "as and authenticated admin" do
    before(:each) do
      visit "/"
      click_link("Login")
      fill_in("Email", with: "admin@admin.com")
      fill_in("Password", with: "admin")
      click_button "Login"
      visit "/admin/items"
    end
    it "returns admin items page" do
      expect(page).not_to have_content(404)
      expect(page).to have_content("Admin Items")
    end
    it "404s" do
      expect(page.status_code).to eq(200)
    end

    it "displays a table with all items" do
      Item.all.each do |item|
        expect(page).to have_content(item.name)
      end
    end

    it "displays status for each item" do
      Item.all.each do |item|
        expect(page).to have_content(item.status)
      end
    end

    it "displays status for each item" do
      Item.all.each do |item|
        expect(page).to have_content(item.status)
      end
    end
  end
end
