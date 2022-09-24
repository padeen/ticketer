require "rails_helper"

RSpec.describe "tickets", type: :request do
  describe "GET /index" do
    it "return status code success" do
      test_prescriptions = FactoryBot.create(:project, name: "Rails test prescriptions", description: "Learn testing in rails")
      FactoryBot.create(:ticket, project: test_prescriptions,
        name: "Ticket ticket",
        description: "Ticket ticket description")

      get "/projects/1/tickets"

      expect(response).to have_http_status(:success)
    end
  end
end