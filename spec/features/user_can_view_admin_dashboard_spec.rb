require "rails_helper"

feature "admin dashboard" do

  it "a guest can not view the admin dashboard" do
    visit "/admin/dashboard"
    expect(page).to have_content("404")
  end

  it "a non admin can not view the admin dashboard" do
    visit "/"
    click_link "Login"
    fill_in("Email",  with: "jeff@gmail.com")
    fill_in("Password",  with: "pass")
    visit "/admin/dashboard"
    expect(page).to have_content("404")
  end

  it "an admin is automatically directed to the admin dashboard at login" do
    visit "/"
    click_link "Login"
    fill_in("Email",  with: "admin@admin.com")
    fill_in("Password",  with: "admin")
    click_button "Login"
    expect(current_path).to eq("/admin/dashboard")
    expect(page).to have_content("Admin Dashboard")
  end
end
