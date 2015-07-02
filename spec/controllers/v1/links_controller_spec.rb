require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe V1::LinksController, type: :controller do

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # LinksController. Be sure to keep this updated too.
  before :each do
    request.headers.merge!({ 'Authorization' => create(:user).access_token })
  end

  let!(:link) { create :link }

  describe "GET #index" do
    it "assigns all links as @links" do
      get :index, {}
      expect(assigns(:links)).to eq([link])
    end
  end

  describe "GET #show" do
    it "assigns the requested link as @link" do
      get :show, {:id => link.to_param}
      expect(assigns(:link)).to eq(link)
    end

    it "returns an error if the link is not found" do
      get :show, {:id => "999999"}
      expect(response).to be_not_found
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Link" do
        expect {
          post :create, {:link => attributes_for(:link)}
        }.to change(Link, :count).by(1)
      end

      it "assigns a newly created link as @link" do
        post :create, {:link => attributes_for(:link)}
        expect(assigns(:link)).to be_a(Link)
        expect(assigns(:link)).to be_persisted
      end

      it "responds with HTTP created" do
        post :create, {:link => attributes_for(:link)}
        expect(response).to have_http_status(:created)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved link as @link" do
        post :create, {:link => attributes_for(:invalid_link)}
        expect(assigns(:link)).to be_a_new(Link)
      end

      it "responds with HTTP unprocessable_entity" do
        post :create, {:link => attributes_for(:invalid_link)}
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { :url => "test_new_url.com" }
      }

      it "updates the requested link" do
        put :update, {:id => link.to_param, :link => new_attributes}
        link.reload
        expect(link.url).to eq "test_new_url.com"
      end

      it "assigns the requested link as @link" do
        put :update, {:id => link.to_param, :link => attributes_for(:link)}
        expect(assigns(:link)).to eq(link)
      end

      it "responds with HTTP no_content" do
        put :update, {:id => link.to_param, :link => attributes_for(:link)}
        expect(response).to have_http_status(:no_content)
      end
    end

    context "with invalid params" do
      it "assigns the link as @link" do
        put :update, {:id => link.to_param, :link => attributes_for(:invalid_link)}
        expect(assigns(:link)).to eq(link)
      end

      it "responds with HTTP unprocessable_entity" do
        put :update, {:id => link.to_param, :link => attributes_for(:invalid_link)}
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested link" do
      expect {
        delete :destroy, {:id => link.to_param}
      }.to change(Link, :count).by(-1)
    end

    it "responds with HTTP no_content" do
      delete :destroy, {:id => link.to_param}
      expect(response).to have_http_status(:no_content)
    end
  end

end