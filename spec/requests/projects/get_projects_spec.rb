require "rails_helper"

RSpec.describe "posts", type: :request do
  describe "GET /index" do
    it "return status code success" do
      FactoryBot.create(:project, name: "Rails test prescriptions", description: "Learn testing in rails")

      get "/projects"
      expect(response).to have_http_status(:success)
    end
  end
end