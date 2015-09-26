require "rails_helper"

describe 'a user logs in logs out', type: :feature do
  context "the user who has an account logs in" do
    it "logs in the new user properly with valid info submitted" do
      visit "/"
      click_link("Create Account")
      fill_in('new_user[email]', with: 'J@gmail.com')
      fill_in('new_user[user_name]', with: 'Jeffy')
      fill_in('new_user[password]', with: 'pass')
      fill_in('new_user[password_confirmation]', with: 'pass')
      click_button "Create"
      expect(current_path).to eq(dashboard_path)
      click_link("Logout")
      click_link("Login")
      fill_in("Email", with: "J@gmail.com")
      fill_in("Password", with: 'pass')
      click_button 'Login'
      expect(current_path).to eq(dashboard_path)
    end

  end
end
