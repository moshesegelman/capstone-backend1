User.create!([ 
  { first_name: "moshe", last_name: "segelman", username: "msegelman", email: "moshe@gmail.com", password: "password", password_confirmation: "password"},
  { first_name: "jack", last_name: "smith", username: "jsmith", email: "jack@gmail.com", password: "password", password_confirmation: "password"},
  { first_name: "jill", last_name: "parky", username: "jparky", email: "jill@gmail.com", password: "password", password_confirmation: "password"}
])
user1 = User.first
user2 = User.second
user3 = User.third 

Subject.create!([ 
  {name:"math", image_url:"https://lh3.googleusercontent.com/proxy/_kl70Ddp-IDDUBkZHEwB2xe1erPKDs0S4gDcTrxA85MNbfKJA-62hRVKstJfFl5QwzSRumsc0hFLKXtsPd2_DLMj"},
  {name:"science", image_url:"http://sms.ssd6.org/files/2016/08/science.png"},
  {name:"english", image_url:"https://akm-img-a-in.tosshub.com/sites/rd/resources/201909/english-speaking_1567496966_684x384.png"}
])
subject1 = Subject.first
subject2 = Subject.second
subject3 = Subject.third

Channel.create!([ 
  {name:"pre-calc", details: "preparing for test that involves these methods", user_id: user1.id, subject_id: subject1.id},
  {name:"bio", details: "studying the human cells", user_id: user2.id, subject_id: subject2.id},
  {name:"shakespear", details: "going over Julias Ceasar", user_id: user3.id, subject_id: subject3.id}
])

channel1 = Channel.first
channel2 = Channel.second
channel3 = Channel.third

Conversation.create!([ 
  {sender_id: user1.id,recipient_id: user2.id},
  {sender_id: user2.id,recipient_id: user3.id},
  {sender_id: user3.id,recipient_id: user1.id}
])

conversation1 = Conversation.first
conversation2 = Conversation.second
conversation3 = Conversation.third

Message.create!([ 
  {text:"hey what methods are you going over?", user_id: user2.id, channel_id: channel1.id },
  {text:"hey im going over white blood cells and their diseases", user_id: user3.id, channel_id: channel2.id },
  {text:"i just finished with that play in class hmu", user_id: user1.id, channel_id: channel3.id },
  {text:"hey im going over this method wanna work together", user_id: user1.id,  conversation_id: conversation1.id},
  {text:"im going over red blood cells but maybe we can help eachother out", user_id:user2.id,  conversation_id: conversation2.id},
  {text:"hey you just did it in school if you can help me out that would be great", user_id: user3.id,  conversation_id: conversation3.id},
])
