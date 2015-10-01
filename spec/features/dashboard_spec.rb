require 'rails_helper'

feature "dashboard" do
  before(:each) do
    visit "/"
  end

  context "when not logged in" do
    it "redirects to index" do
      visit "/dashboard"

      expect(current_path).to eq("/")
    end
  end
end
