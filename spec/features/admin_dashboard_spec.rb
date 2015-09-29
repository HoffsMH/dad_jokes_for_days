require "rails_helper"

feature "admin Dashboard" do
  context "as a visitor" do
    before(:each) do
      visit "/"
    end
    it "will not return 404" do
      visit "/admin/dashboard"
      expect(page.status_code).to eq(404)
    end
    it "will not display admin dashboard" do
      visit "/admin/dashboard"
      expect(page).not_to have_content("Admin Dashboard")
    end
    
  end
end