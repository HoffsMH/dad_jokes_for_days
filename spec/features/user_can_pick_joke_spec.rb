require "rails_helper"

feature "The home page" do
  fixtures :jokes
  before(:each) do
    visit "/"
  end

  it "has a random joke option" do
    expect(page).to have_button("Pick a random joke for me!")
  end

  it "leads to /items after selecting a joke" do
    click_button "Pick a random joke for me!"
    expect(current_path).to eq(items_path)
  end

  it "displays the joke on the page after selection" do
    Joke.all.stub(:sample).and_return(Joke.all.first)
    click_button "Pick a random joke for me!"
    expect(page).to have_content(" ... ")
  end

end
