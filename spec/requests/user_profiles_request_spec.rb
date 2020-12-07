require 'rails_helper'

RSpec.describe "UserProfiles", type: :request do

  describe "GET /new" do
    it "returns http success" do
      get "/user_profiles/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/user_profiles/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/user_profiles/show"
      expect(response).to have_http_status(:success)
    end
  end

end
