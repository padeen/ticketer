require "rails_helper"

RSpec.describe "Projects", type: :request do
  describe "POST /create" do
    context "with valid parameters" do
      it "returns status code created" do
        post "/projects", params: {
          project: {
            name: "Ticketer rails angular",
            description: "Ticket tracker in rails and angular"
          }
        }

        expect(response).to have_http_status(:created)
      end
    end

    context "with invalid parameters" do
      it "returns status code unprocessable entity" do
        post "/projects", params: {
          project: {
            name: "",
            description: ""
          }
        }
      end
    end
  end
end