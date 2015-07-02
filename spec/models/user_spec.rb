require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = create(:user)
  end

  it "has a valid factory" do
    expect(@user).to be_valid
  end

  it "is invalid without a username" do
    user = build(:user, username: nil)
    expect(user).not_to be_valid
  end

  it "is invalid without an email" do
    user = build(:user, email: nil)
    expect(user).not_to be_valid
  end
end
