require "rails_helper"

RSpec.describe "Tickets", type: :request do
  describe "DELETE /destroy" do
    it "returns status code no content" do
      test_prescriptions = FactoryBot.create(:project, name: "Rails test prescriptions", description: "Learn testing in rails")
      FactoryBot.create(:ticket, project: test_prescriptions, 
        name: "Rails test prescriptions", 
        description: "Learn testing in rails")

      delete "/projects/1/tickets/1"

      expect(response).to have_http_status(204)
    end
  end
end

