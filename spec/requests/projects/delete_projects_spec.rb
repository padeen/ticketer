require "rails_helper"

RSpec.describe "Projects", type: :request do
  describe "DELETE /destroy" do
    it "returns status code no content" do
      FactoryBot.create(:project, name: "Ticketer rails angular", description: "Ticket tracker in rails and angular")

      delete "/projects/1"

      expect(response).to have_http_status(204)
    end
  end
end

