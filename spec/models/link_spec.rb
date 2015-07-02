require 'rails_helper'

RSpec.describe Link, type: :model do
  before :each do
    @link = create(:link)
  end

  it "has a valid factory" do
    expect(@link).to be_valid
  end

  it "has access to many binders" do
    binder_one = create(:binder)
    binder_two = create(:binder)
    @link.binders << binder_one
    @link.binders << binder_two
    expect(@link.binders.length).to eq 2
  end

  it "has a working create_pdf method" do
    @link.url = "http://www.google.com"
    @link.save
    @link.create_pdf
  end
end
