require "rails_helper"

describe 'a user logs in logs out', type: :feature do

  describe "the user who has an account logs in" do
    before(:each) do
      visit "/"
      click_link("Create Account")
      fill_in('new_user[email]', with: 'J@gmail.com')
      fill_in('new_user[user_name]', with: 'Jeffy')
      fill_in('new_user[password]', with: 'pass')
      fill_in('new_user[password_confirmation]', with: 'pass')
      click_button "Create"
      click_link("Logout")
    end

    it "logs in the new user properly with valid info submitted" do
      click_link("Login")
      fill_in("Email", with: 'J@gmail.com')
      fill_in("Password", with: 'pass')
      click_button "Login"
      expect(current_path).to eq(dashboard_path)
    end

    it "won't allow a logged in user to log in" do
      click_link("Login")
      fill_in("Email", with: 'J@gmail.com')
      fill_in("Password", with: 'pass')
      click_button "Login"
      visit '/login'
      expect(page).to have_content("Please log out Before switching User")
      expect(page).not_to have_content("Login")
    end
  end

  describe "the registered user can't log in with invalid info" do
    before(:each) do
      visit "/"
      click_link("Create Account")
      fill_in('new_user[email]', with: 'J@gmail.com')
      fill_in('new_user[user_name]', with: 'Jeffy')
      fill_in('new_user[password]', with: 'pass')
      fill_in('new_user[password_confirmation]', with: 'pass')
      click_button "Create"
      click_link("Logout")
    end

    it "won't allow user to log in with invalid password" do
      click_link("Login")
      fill_in("Email", with: 'J@gmail.com')
      fill_in("Password", with: 'wrongpassword')
      click_button "Login"
      expect(current_path).to eq('/login')
      expect(page).to have_content("Invalid Login")
    end

    it "won't allow user to log in with invalid email" do
      click_link("Login")
      fill_in("Email", with: 'Jgmailcom')
      fill_in("Password", with: 'pass')
      click_button "Login"
      expect(current_path).to eq('/login')
      expect(page).to have_content("Invalid Login")
    end
  end

  describe "the user does not have an account" do

    it "wont' allow user to log in" do
      visit '/login'
      fill_in("Email", with: 'J@gmail.com')
      fill_in("Password", with: 'wrongpassword')
      click_button "Login"
      expect(current_path).to eq('/login')
      expect(page).to have_content("Invalid Login")
    end

  end
end
