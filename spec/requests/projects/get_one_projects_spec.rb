require "rails_helper"

RSpec.describe "projects", type: :request do
  describe "GET /show" do
    it "return status code success" do
      FactoryBot.create(:project, name: "Rails test prescriptions", description: "Learn testing in rails")

      get "/projects/1"
      expect(response).to have_http_status(:success)
    end
  end
end