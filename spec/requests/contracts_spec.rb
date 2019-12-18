require 'rails_helper'

RSpec.describe "Contracts", type: :request do
  describe "GET /contracts" do
    let(:user) { create(:user, :customer) }
    it "have user authenticated" do
      sign_in user
      get contracts_path
      expect(response).to have_http_status(200)
    end

    it "dont have user" do
      get contracts_path
      expect(response).to have_http_status(302)
    end
  end
end
