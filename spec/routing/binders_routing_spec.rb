require "rails_helper"

RSpec.describe V1::BindersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/v1/binders").to route_to("v1/binders#index", :format => :json)
    end

    it "routes to #show" do
      expect(:get => "/v1/binders/1").to route_to("v1/binders#show", :id => "1", :format => :json)
    end

    it "routes to #create" do
      expect(:post => "/v1/binders").to route_to("v1/binders#create", :format => :json)
    end

    it "routes to #update via PUT" do
      expect(:put => "/v1/binders/1").to route_to("v1/binders#update", :id => "1", :format => :json)
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/v1/binders/1").to route_to("v1/binders#update", :id => "1", :format => :json)
    end

    it "routes to #destroy" do
      expect(:delete => "/v1/binders/1").to route_to("v1/binders#destroy", :id => "1", :format => :json)
    end

  end
end
