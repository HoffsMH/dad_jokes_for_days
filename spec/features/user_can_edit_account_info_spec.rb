require 'rails_helper'

feature "Account info update" do
  fixtures :users

  before(:each) do
    visit "/login"
    fill_in "Email", with: "jeff@gmail.com"
    fill_in "Password", with: "pass"
    click_button("Login")
  end

  it "user can edit account info" do
    visit "/dashboard"
    fill_in("user[user_name]", with: "newname")
    fill_in("user[email]", with: "newemail@new.com")

    click_link_or_button("Update Info")
    save_and_open_page
    expect(page).to have_content("You ")

    click_link("Logout")
    click_link("Login")
    fill_in "Email", with: "newemail@new.com"
    fill_in "Password", with: "pass"
    click_button("Login")

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("The Dad welcomes you")
  end

end
