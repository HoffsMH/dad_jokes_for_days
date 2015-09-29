require "rails_helper"

feature "admin items page" do
  context "as an unauthenticated user" do
    before(:each) do
      visit "/admin/items"
    end
    it "returns not found page" do
      save_and_open_page
      expect(page).to have_content(404)
      expect(page).not_to have_content("Admin Items")
    end
  end
end
