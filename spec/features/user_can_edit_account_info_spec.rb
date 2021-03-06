require 'rails_helper'

feature "Account info update" do
  fixtures :users

  before(:each) do
    visit "/login"
    fill_in "Email", with: "jeff@gmail.com"
    fill_in "Password", with: "pass"
    click_button("Login")
  end

  xit "user can edit account info" do
    fill_in("user[user_name]", with: "newname")
    fill_in("user[email]", with: "newemail@new.com")

    click_button("Update Info")

    expect(page).to have_content("You have successfully updated your information!")

    click_link("Logout")
    click_link("Login")
    fill_in "Email", with: "newemail@new.com"
    fill_in "Password", with: "pass"
    click_button("Login")

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("The Dad welcomes you")
  end

end
