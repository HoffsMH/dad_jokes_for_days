require "rails_helper"

feature "admin item edit page" do
  fixtures :items
  fixtures :users
  fixtures :jokes
  fixtures :categories

  context "as an unauthenticated user" do
    before(:each) do
      visit "/admin/items/#{Item.second.id}/edit"
    end

    it "page isn't found" do
      expect(page).not_to have_content("Admin Items")
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
      visit "/admin/items/#{Item.second.dao}/edit"
    end

    it "page isn't found" do
      expect(page).not_to have_content("Admin Items")
      expect(page.status_code).to eq(404)
    end
  end

  context "as an authenticated admin" do
    before(:each) do
      visit "/"
      click_link("Login")
      fill_in("Email", with: "admin@admin.com")
      fill_in("Password", with: "admin")
      click_button "Login"
      visit "/admin/items/#{Item.second.dao}/edit"
    end

    it "returns admin items page" do
      expect(page).to have_content("Item Administration - Edit #{Item.second.name}")
    end

    it "200s" do
      expect(page.status_code).to eq(200)
    end

    it "displays input for item name" do
      expect(page).to have_selector("input[name='item[name]']")
    end

    it "displays input for item description" do
      expect(page).to have_selector("input[name='item[description]']")
    end

    it "displays input for item price" do
      expect(page).to have_selector("input[name='item[price]']")
    end

    it "displays input for item image_url" do
      expect(page).to have_selector("input[name='item[image_url]']")
    end

    context "user edits an item" do
      before(:each) do
        fill_in "item[name]", with: "edited item"
        click_link_or_button "Update Item"
      end

      it "redirects to admin items index" do
        expect(current_path).to eq(admin_items_path)
      end

      it "displays the updated item" do
        expect(page).to have_content('edited item')
      end
    end
  end

end
