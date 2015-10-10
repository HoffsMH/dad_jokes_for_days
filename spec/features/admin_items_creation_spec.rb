require 'rails_helper'

feature "admin item creation page" do
  fixtures :items
  fixtures :users
  fixtures :jokes
  fixtures :categories

  context "as an unauthenticated user" do
    before(:each) do
      visit "/admin/items/new"
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
      visit "/admin/items/new"
    end
    it "returns not found page" do
      expect(page).to have_content(404)
      expect(page).not_to have_content("Admin Items")
    end
    it "404s" do
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
      visit "/admin/items/new"
    end

    it "returns admin items page" do
      expect(page).not_to have_content(404)
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

    context "when creating an item" do
      before(:each) do
        visit "/admin/items/new"
        fill_in("Name", with: "Admin Item")
        fill_in("Description", with: "This is an admin created item")
        fill_in("Price", with: 90.09)
        find('#item_category_id').find(:xpath, 'option[2]').select_option
        click_button "Create"
      end
      it "redirects to admin item index" do
        expect(current_path).to eq(admin_items_path)
      end
      it "displays the created item on the next page" do
        expect(page).to have_link("Admin Item")
        expect(page).to have_content("This is an admin created item")
      end
    end
    context "when trying to create an invalid item" do
      before(:each) do
        visit "/admin/items/new"
        fill_in("Name", with: "Admin Item")
        fill_in("Description", with: "This is an admin created item")
        fill_in("Price", with: 90.09)
        find('#item_category_id').find(:xpath, 'option[2]').select_option
      end
      it "redirects to new item form" do
        fill_in("Name", with: "")
        click_button "Create"
        expect(current_path).to eq(new_admin_item_path)
      end
    end

    context "when trying to create an item twice" do
      before(:each) do
        2.times do
          visit "/admin/items/new"
          fill_in("Name", with: "Admin Item")
          fill_in("Description", with: "This is an admin created item")
          fill_in("Price", with: 90.09)
          find('#item_category_id').find(:xpath, 'option[2]').select_option
          click_button "Create"
        end
      end
      it "redirects to item form" do
        expect(current_path).to eq(new_admin_item_path)
      end

      it "wont' let the user create it" do
        expect(page).to have_content("has already been taken")
      end
    end

    context "when trying to create an item with alpha price" do
      before(:each) do
          visit "/admin/items/new"
          fill_in("Name", with: "Admin Item")
          fill_in("Description", with: "This is an admin created item")
          fill_in("Price", with: "asdf")
          find('#item_category_id').find(:xpath, 'option[2]').select_option
          click_button "Create"
      end
      it "redirects to item form" do
        expect(current_path).to eq(new_admin_item_path)
      end

      it "wont' let the user create it" do
        expect(page).to have_content("no")
      end
    end
  end
end
