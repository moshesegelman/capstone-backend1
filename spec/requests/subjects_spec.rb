require 'rails_helper'

RSpec.describe "Subjects", type: :request do
  before do
    user = User.create(first_name: "Test", last_name: "test", username: "Testtest",email: "test@email.com", password: "password")
    Subject.create!([ 
      {name:"math", image_url:"https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQjx0t8eLaPHrPJiVSvKjwr-OhWd2s4b75NgQ&usqp=CAU"},
      {name:"english", image_url:"https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSCselH4EtSN58utF5exMaYxeLZ0tdTvTYKKw&usqp=CAU"}
    ]) 
  end
  describe "GET /subjects" do
    it "should show all subjects" do
      get "/api/subjects"
      expect(response).to have_http_status(200)
    end
  end
  describe "GET /subjects/:id" do
    it "should s subject" do
      subject = Subject.first
      get "/api/subjects/#{subject.id}"
      subject = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(subject["name"]).to eq("math")
    end
  end
end
