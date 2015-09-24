require "rails_helper"

feature "when I visit home page" do
  fixtures :jokes
  before(:each) do
    visit '/'
  end
  it "has a random joke" do
    expect(page).to have_button('Pick a random joke for me!')
  end

  it  "redirects to /items" do
    click_button 'Pick a random joke for me!'
    expect(current_path).to eq(items_path)
  end

  xit 'adds the joke id to our session' do
    click_button 'Pick a random joke for me!'

    expect(session[:joke_id]).not_to be_nil
  end

end
