User.create!([ 
  { first_name: "moshe", last_name: "segelman", username: "msegelman", email: "moshe@gmail.com", password: "password", password_confirmation: "password"},
  { first_name: "jack", last_name: "smith", username: "jsmith", email: "jack@gmail.com", password: "password", password_confirmation: "password"},
  { first_name: "jill", last_name: "parky", username: "jparky", email: "jill@gmail.com", password: "password", password_confirmation: "password"}
])
user1 = User.first
user2 = User.second
user3 = User.third 

Subject.create!([ 
  {name:"math", image_url:"https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQjx0t8eLaPHrPJiVSvKjwr-OhWd2s4b75NgQ&usqp=CAU"},
  {name:"science", image_url:"https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSEQriX-ElM2LnUsWDiVWNyK6PkObRU_1bb6w&usqp=CAU"},
  {name:"english", image_url:"https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSCselH4EtSN58utF5exMaYxeLZ0tdTvTYKKw&usqp=CAU"}
])

Channel.create!([ 
  {name:"pre-calc", details: "preparing for test that involves these methods", user_id: user1.id, subject_id: 1},
  {name:"bio", details: "studying the human cells", user_id: user2.id, subject_id: 2},
  {name:"shakespear", details: "going over Julias Ceasar", user_id: user3.id, subject_id: 3}
])

Conversation.create!([ 
  {sender_id: user1.id,recipient_id: user2.id},
  {sender_id: user2.id,recipient_id: user3.id},
  {sender_id: user3.id,recipient_id: user1.id}
])

Message.create!([ 
  {text:"hey what methods are you going over?", user_id: user2.id, channel_id: 1, },
  {text:"hey im going over white blood cells and their diseases", user_id: user3.id, channel_id: 2, },
  {text:"i just finished with that play in class hmu", user_id: user1.id, channel_id: 3, },
  {text:"hey im going over this method wanna work together", user_id: user1.id,  conversation_id:1},
  {text:"im going over red blood cells but maybe we can help eachother out", user_id:user2.id,  conversation_id: 2},
  {text:"hey you just did it in school if you can help me out that would be great", user_id: user3.id,  conversation_id: 3},
])
