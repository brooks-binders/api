require 'rails_helper'

RSpec.describe "Links", type: :request do
  describe "GET /links" do

    let(:session_params) { { 'Authorization' => create(:user).access_token } }

    it "should respond with HTTP 200" do
      get "/v1/links", {}, session_params
      expect(response).to have_http_status(200)
    end
  end
end
