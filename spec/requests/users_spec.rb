require 'rails_helper'

RSpec.describe "Users", type: :request do
  before do
    user = User.create(first_name: "Test", last_name: "test", username: "Testtest",email: "test@email.com", password: "password")
  end
  describe "GET /users/:id" do
    it "should return a user" do
      user = User.first
      jwt = JWT.encode(
        {
          user_id: user.id, # the data to encode
          exp: 24.hours.from_now.to_i # the expiration time
        },
        Rails.application.credentials.fetch(:secret_key_base), # the secret key
        "HS256" # the encryption algorithm
      )
      get "/api/users/#{user.id}",
      headers: { "Authorization" => "Bearer #{jwt}"}
      user = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(user["first_name"]).to eq("Test")
    end
    it "should return unauthorized user" do
      user = User.first
      get "/api/users/#{user.id}"
      user = JSON.parse(response.body)
      expect(response).to have_http_status(401)
    end
  end
end
