require 'rails_helper'

RSpec.describe "Binders", type: :request do

  let(:user) { create(:user) }
  let(:session_params) { { "Authorization": user.access_token,
                           "Accept": "application/json",
                           "Content-Type": "application/json" } }

  let!(:binder) { create :binder, name: "test_binder", user_id: user.id }

  describe "GET /v1/binders" do

    it "returns a 200" do
      get "/v1/binders", {}, session_params
      expect(response).to have_http_status 200
    end

    it "returns the users binders" do
      create_list(:binder, 10, user: user)
      get "/v1/binders", {}, session_params
      expect(json.length).to eq 11
    end
  end

  describe "GET /v1/binders/:id" do

    it "returns a 200" do
      get "/v1/binders/#{binder.id}", {}, session_params
      expect(response).to have_http_status 200
    end

    it "returns a requested binder" do
      get "/v1/binders/#{binder.id}", {}, session_params
      expect(json["name"]).to eq "test_binder"
    end
  end

  describe "POST /v1/binders" do

    let(:create_params) {
      { "binder": attributes_for(:binder, name: "test_binder") }.to_json
    }

    it "creates a binder" do
      post "/v1/binders", create_params, session_params
      expect(response).to have_http_status 201
      expect(json["name"]).to eq "test_binder"
    end

  end

  describe "PUT /v1/binders/:id" do

    let(:update_params) {
      { binder: { name: "test_new_name" } }.to_json
    }

    it "updates the requested binder" do
      put "/v1/binders/#{binder.id}", update_params, session_params
      binder.reload
      expect(binder.name).to eq "test_new_name"
    end
  end

  describe "DELETE /v1/binders/:id" do

    it "returns a 204" do
      delete "/v1/binders/#{binder.id}", {}, session_params
      expect(response).to have_http_status(:no_content)
    end

    it "destroys the requested binder" do
      expect {
        delete "/v1/binders/#{binder.id}", {}, session_params
      }.to change(Binder, :count).by(-1)
    end
  end
end
