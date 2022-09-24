require "rails_helper"

RSpec.describe "Tickets", type: :request do
  describe "PATCH /update" do
    before do
      test_prescriptions = FactoryBot.create(:project, name: "Rails test prescriptions", description: "Learn testing in rails")
      FactoryBot.create(:ticket, project: test_prescriptions, 
        name: "Rails test prescriptions", 
        description: "Learn testing in rails")
    end

    context "with valid parameters" do
      it "returns status code success" do
        patch "/projects/1/tickets/1", params: {
          ticket: {
            name: "Rails test prescriptions updated",
            description: "Learning testing in rails updated"
          }
        }

        expect(response).to have_http_status(:success)
      end
    end

    context "with invalid parameters" do
      it "returns status code unprocessable entity" do
        patch "/projects/1/tickets/1", params: {
          ticket: {
            name: "",
            description: ""
          }
        }
      end
    end
  end
end
