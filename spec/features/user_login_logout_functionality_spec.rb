require "rails_helper"

describe 'a user logs in logs out', type: :feature do


  describe "the user who has an account logs in" do
    # before(:all) do
    #   # click_button("Login")
    # end

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
      fill_in("Email", with: "Jeffy")
      fill_in("Password", with: 'pass')
      expect(current_path).to eq(dashboard_path)
    end

  end

  # describe "the user does exist" do
  #
  #
  # end
  #
  # describe "user is already signed in" do
  #   before(:each) do
  #   end
  #
  # end
end
