require "rails_helper"

RSpec.describe User, type: :model do
  let(:user) do
    User.new(email: "joe@example.com", user_name: "joe", password: "pass")
end

  it 'is valid' do
    expect(user).to be_valid
  end

  it "is invalid without a user name" do
    user.user_name = nil
    expect(user).not_to be_valid
  end

  it "is invalid with out an email" do
    user.email = nil
    expect(user).not_to be_valid
  end

  it "is invalid with out unique email" do
    user.save
    user2 = User.create(email: "joe@example.com", user_name: "joe", password: "pass")
    expect(user2).not_to be_valid
  end

  xit "is invalid with out a password confirmation" do

  end
end
