require 'rails_helper'

RSpec.describe Binder, type: :model do
  before :each do
    @binder = create(:binder)
  end

  it "has a valid factory" do
    expect(@binder).to be_valid
  end

  it "has access to many links" do
    link_one = create(:link)
    link_two = create(:link)
    @binder.links << link_one
    @binder.links << link_two
    expect(@binder.links.length).to eq 2
  end
end
