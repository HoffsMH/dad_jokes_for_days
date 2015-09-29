require "rails_helper"

describe 'a new user signin up', type: :feature do
  fixtures :categories
  fixtures :items
  fixtures :users
  describe "the user does not already exist" do

    before(:each) do
      visit "/"
      click_link("Create Account")
    end

    it "can create a new account" do
      fill_in('new_user[email]', with: 'Jeff@gmail.com')
      fill_in('new_user[user_name]', with: 'Jeffy')
      fill_in('new_user[password]', with: 'pass')
      fill_in('new_user[password_confirmation]', with: 'pass')
      click_button "Create"
      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("Username:")
      expect(page).to have_content("Email:")
    end

    it "can not create an account without a username" do
      fill_in('new_user[email]', with: 'Jeff@gmail.com')
      fill_in('new_user[password]', with: 'pass')
      fill_in('new_user[password_confirmation]', with: 'pass')
      click_button "Create"
      expect(current_path).to eq('/register')
      expect(page).to have_content("User name can't be blank")
    end

    it "can not create an account without an email" do
      fill_in('new_user[user_name]', with: 'Jeffy')
      fill_in('new_user[password]', with: 'pass')
      fill_in('new_user[password_confirmation]', with: 'pass')
      click_button "Create"
      expect(current_path).to eq('/register')
      expect(page).to have_content("Email can't be blank")
    end

    it "can not create an account with an invalid email address" do
      fill_in('new_user[password]', with: 'pass')
      fill_in('new_user[email]', with: 'Jeffgmailcom')
      fill_in('new_user[user_name]', with: 'Jeffy')
      fill_in('new_user[password_confirmation]', with: 'pass')
      click_button "Create"
      expect(current_path).to eq('/register')
      expect(page).to have_content("Email is invalid")
    end

    it "can not create an account without a password" do
      fill_in('new_user[email]', with: 'Jeff@gmail.com')
      fill_in('new_user[user_name]', with: 'Jeffy')
      fill_in('new_user[password_confirmation]', with: 'pass')
      click_button "Create"
      expect(current_path).to eq('/register')
      expect(page).to have_content("Password can't be blank")
    end

    it "can not create an account without a password confirmation" do
      fill_in('new_user[email]', with: 'Jeff@gmail.com')
      fill_in('new_user[user_name]', with: 'Jeffy')
      fill_in('new_user[password]', with: 'pass')
      click_button "Create"
      expect(current_path).to eq('/register')
      expect(page).to have_content("Password confirmation doesn't match Password")
    end
  end

  describe "the user DOES already exist" do
    before(:each) do
      visit "/"
      click_link("Create Account")
      fill_in('new_user[email]', with: 'Jeff@gmail.com')
      fill_in('new_user[user_name]', with: 'Jeffy')
      fill_in('new_user[password]', with: 'pass')
      fill_in('new_user[password_confirmation]', with: 'pass')
      click_button "Create"
    end

    it "can not create an account with an email already taken" do
      click_link("Logout")
      visit "/"
      click_link("Create Account")
      fill_in('new_user[email]', with: 'Jeff@gmail.com')
      fill_in('new_user[user_name]', with: 'J')
      fill_in('new_user[password]', with: 'pa')
      fill_in('new_user[password_confirmation]', with: 'pa')
      click_button "Create"
      expect(page).to have_content("Email has already been taken")
    end
  end
  context "user is already Logged in" do
    before(:each) do
      visit "/"
      click_link("Login")
      fill_in("Email", with: 'jeff@gmail.com')
      fill_in("Password", with: 'pass')
      click_button "Login"
    end
    it "can not create an account" do
      visit '/register'
      expect(page).to have_content("Please Log out before making a new Account")
    end
  end
end
