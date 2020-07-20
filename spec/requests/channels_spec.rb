require 'rails_helper'

RSpec.describe "Channels", type: :request do
  before do
    user1 = User.create(first_name: "Test", last_name: "test", username: "Testtest",email: "test@gmail.com", password: "password")
    user2 = User.create(first_name: "moshe", last_name: "segelman", username: "msegelman",email: "msegelman@gmail.com", password: "password")
    Subject.create!([ 
      {name:"math", image_url:"https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQjx0t8eLaPHrPJiVSvKjwr-OhWd2s4b75NgQ&usqp=CAU"},
      {name:"english", image_url:"https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSCselH4EtSN58utF5exMaYxeLZ0tdTvTYKKw&usqp=CAU"}
    ])
    Channel.create!([ 
      {name:"pre-calc", details: "preparing for test that involves these methods", user_id: user1.id, subject_id: Subject.first.id},
      {name:"bio", details: "studying the human cells", user_id: user2.id, subject_id: Subject.second.id}
    ])
  end
  describe "GET /channels/:id" do
    it "should return a channel" do
      channel = Channel.first
      get "/api/channels/#{channel.id}"
      channel = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(channel["name"]).to eq("pre-calc")
    end
  end
end
