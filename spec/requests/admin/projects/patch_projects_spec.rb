require "rails_helper"

RSpec.describe "Projects", type: :request do
  describe "PATCH /update" do
      before do
        FactoryBot.create(:project, name: "Ticketer rails angular", description: "Ticket tracker in rails and angular")
      end

    context "with valid parameters" do
      it "returns status code success" do
        patch "/admin/projects/1", params: {
          project: {
            name: "Ticketer rails angular updated",
            description: "Ticket tracker in rails and angular updated"
          }
        }

        expect(response).to have_http_status(:success)
      end
    end

    context "with invalid parameters" do
      it "returns status code unprocessable entity" do
        patch "/admin/projects/1", params: {
          project: {
            name: "",
            description: ""
          }
        }
      end
    end
  end
end
