require "rails_helper"

RSpec.describe "Tickets", type: :request do
  describe "POST /create" do
    before do
      project = FactoryBot.create(:project, name: "Test project", description: "Test project description")
    end

    context "with valid parameters" do
      it "returns status code created" do
        post "/projects/1/tickets", params: {
          ticket: {
            name: "Ticket time not responding",
            description: "Time inside ticket doesn't respond"
          }
        }

        expect(response).to have_http_status(:created)
      end
    end
  end
end
