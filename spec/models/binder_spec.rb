require 'rails_helper'

RSpec.describe Binder, type: :model do
  before :each do
    @binder = create(:binder)
  end

  it "has a valid factory" do
    expect(@binder).to be_valid
  end

  it "has access to many links" do
    link_one = build(:link)
    link_two = build(:link)
    @binder.links << link_one
    @binder.links << link_two
    expect(@binder.links.length).to eq 2
  end

  it "creates a pdf collection" do
    @binder.links << create(:link, url: "http://www.washingtonpost.com/lifestyle/magazine/tiny-house-big-benefitsfreedom-from-a-mortgage--and-stuff/2015/06/23/f8f706f0-0acc-11e5-9e39-0db921c47b93_story.html")
    @binder.links << create(:link, url: "http://www.nytimes.com/2015/07/03/world/americas/donald-trump-gains-infamy-in-mexico-for-comments-on-immigrants.html")
    @binder.create_pdf_collection
  end
end
