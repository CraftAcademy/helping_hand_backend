RSpec.describe "PUT api/v1/tasks/:id", type: :request do
  let(:provider) { create(:user) }
  let(:provider_credentials) { provider.create_new_auth_token }
  let(:provider_headers) { { HTTP_ACCEPT: "application/json" }.merge!(provider_credentials) }

  let(:task) { create(:task, status: "claimed") }
  let!(:task_items) { 5.times { create(:task_item, task: task) } }

  describe "Succesfully claims task" do
    before do
      put "/api/v1/tasks/#{task.id}",
          params: { activity: "delivered" },
          headers: provider_headers
    end

    it "returns a 200 response status" do
      expect(response).to have_http_status 200
    end

    it "response with success message" do
      expect(response_json["message"]).to eq "Thank you for your help!"
    end
  end
end
