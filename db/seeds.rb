User.create!([ 
  { first_name: "moshe", last_name: "segelman", username: "msegelman", email: "moshe@gmail.com", password: "password", password_confirmation: "password"},
  { first_name: "jack", last_name: "smith", username: "jsmith", email: "jack@gmail.com", password: "password", password_confirmation: "password"},
  { first_name: "jill", last_name: "parky", username: "jparky", email: "jill@gmail.com", password: "password", password_confirmation: "password"},
  { first_name: "aaron", last_name: "dent", username: "adent", email: "aaron@gmail.com", password: "password", password_confirmation: "password"}
])
user1 = User.find(1)
user2 = User.find(2)
user3 = User.find(3)
user4 = User.find(4)

Friend.create([
  {user1_id: user1.id, user2_id: user2.id, pending: true},
  {user1_id: user1.id, user2_id: user3.id, pending: false},
  {user1_id: user3.id, user2_id: user2.id, pending: true},
  {user1_id: user3.id, user2_id: user4.id, pending: true},
  {user1_id: user4.id, user2_id: user1.id, pending: true},
  ])

Subject.create!([ 
  {name:"Math", image_url:"https://www.westada.org/cms/lib/ID01904074/Centricity/Domain/10362/Math2.jpg"},
  {name:"Science", image_url:"http://sms.ssd6.org/files/2016/08/science.png"},
  {name:"English", image_url:"https://akm-img-a-in.tosshub.com/sites/rd/resources/201909/english-speaking_1567496966_684x384.png"},
  {name:"History", image_url:"https://thumbs.dreamstime.com/b/history-doodles-lettering-white-background-137829155.jpg"},
  {name:"Politics", image_url:"https://www.voicesofyouth.org/sites/default/files/images/2019-01/politics3.jpg"},
  {name:"Random", image_url:"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAAAkFBMVEUhHyD///8AAAAeHB0MCAqenp4hICAdHR0TExMbGRr4+PgICAhwcHAJBAeko6QjIyOTkpLx8fHt7O0sKisWFhbW1tZJR0jEwsMSDxHd3d28ursXFBXk5OTNzc1cXFyLi4utra1oaGh5eXlFQ0Q9OzyBgIBQUFAuLi6YmJi0s7RtbW0/PT58fHxjY2NWVVXJx8gyLN85AAAGqklEQVR4nO2ZiXLiOBCGLYnIF6djYoPNEQIBkkl4/7fblnzJMjABtrayVf83VakpSZH0W63uVsdxAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD8KqT6p378AsQP226bNA4556Hn3jLvbaumvE12aWC27XaJvd8d6A961a8Y8w6yM/vyufO9OibJcPPJU6NfbL0rW862t0hMd6fEZPiVpWcH+tvJstOTbdbcXi3dzRYjUfxvWpMcltnAHsq3w4iVTPu95gumT6/nd6EXXQ57Fzu7DIbMYvbKu8OkGy5YHlu25Hh9NuTWHeodWDBSA2X41Jo4H/umFUiXjwNqDvLZTOucvnDpVnNMXHutCteLhoPbFAZTA7XmqitR8jF1zO0OUkgSLYVjQ2GwKJlpjd/NBNL1TtS0+Nj6vfT5/YlEBptqKpqjs1YFX7OnGxVOeFiTjnaksWsi8bs+hr5lHkqhOsWLCqO4vIbefkMig36zNz7VklOfbFf43FUHvgnrOdjmvCn2XtntCj23hkznM2C57RUEzxn7mjBmuTGt0JLYVvjs6mORZOZ8RWPfK0Plc8aS0KvP3+VL+rYvWa1wsj/rvEfRPQrbLRs6K8uVqe2MOX29adskSWEw0YbaNFsKjW3yJe07LBpS+jantpcakJ1EvFbIFuasBVLyhD2sUIjIvgS9D7Wew480eatHneE7He+aN37hskKH7xg7FLvjExZJy5moQx73aoXkDzoKwx17XKG6IIuWDv85YAFFPm2rSzNuKYVvIy2xbr2iUE0d6KnTnbp0tgA+I6dQzjHJWfAWWwP8LV2h4N9XqHxCX/mA7I2cg2MpfPFkbt7Fawo9ugHLrJgy6jhLmVL3a1Yq/KbAZQdbtZNl9LCVOhE7mqvzA6salB2ZFqwV+tlzYajyrwpdN2AqmLlxxwXrpXlA88hCYXiw74SjQtaQ7PtBheqyfBhN6bdyAMVGXb5oufFCoVNK/LtCSXZ4ol3H5HM+zuSHdEbTSuFIHdiLOcj/pGMNvUcV8jcy9bi5IcLPm4Wkv5/oK9lWWEn8gcKETI9+7w9j51Ja8mVRrTD+bD5t0at24sV3KEzN7FsFra864pN7PppJjuz1VciwFTrZqD7F6wrnLKffDled0FrsZl24Gq1QKGs6Nv6UkhkKWeIehfE6otxQkzMraws3rO131DqHqqFW6PijKmhcV3j6+RkKh0YXLk6Rfulve5fCkJsp8mxpCPL3ASUX5l5EPGsyk0ahE8tZETSuK8xZ8tN7KByRNqvrZEaI+xR6Ln+dqCTiOD8eXrkZhCzPolW9Bywqg6KhUJanKK760tHPfal6gaWURiWlG58XO7lPoZS9PTmu6Ite260vq9zz0d6JaixDhqGQzlud4pGHVxSqlOS7joedjMUz46F+YyovsKOBUt0Wveh9CtX2+FDn0K0NZZQp5nHHI6iD/cM7CukuaonXcpoqaVE5zZ/QsWjlNFqhEJTabGPtw6OR/4hCCnUflNtPHePhJDiZ/nu3niAyyuK2fkehEyuJ69XlvHRcJZ5S56WWr1F+fFXlpZOyTrBU/kXH4cLD369QynCvXnDGI7V4UZypgqWvZchoK5RSS8wvKBScLC0vrSTTb4uWxMG3+bYoFTrKtsYqbpTh9n6FjrJUigQUCsp1B3agaFADn+hxY50hTeGrx7yhcO9KjRuH+h68me/Dk1e/D+lhulTdvq1QkOky6spL5/aQQlq2T5a6eNbmoPL4wDakEjdUrwyvq5AkTlsKR16s8EcvT+Sug6/aL0tlePmy/cbvN2/8SiGl+6qyUgeoBxU6gy19sWipTGlAO/i4UPGSqqoRuW5XoZZoVKKqTGKia01vRuBxU/WYXfQ/RV2n6Rt1msnIrT7FmBlJxqMKndg7qvlSp/fUJNNdhXrZhJ9R6PjZjJ2rtQXTTevekV2uJmatbfESykZhUJ2hPu2mtiDiG9+H6e40b22RssEkOe3SfZIcrxSXRW+dLF7S5Sn5tAf5zqIosWSbZF5yPPTfeMcgBvthXn2AxcegCcXZ5jSvFdILfLJt9ijmpz+Xi6nnJHLbmaS68i3o55XSslT9vqpqdwf5z8/NTFXJOz13owUX36v1fD7sb3krKrXn9fdmHsL5tYL4f8MNRXcRp+f+bnH/hL+P8s9Ov+JvTwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADwv+UfG/tzYziLSw4AAAAASUVORK5CYII="}
])
subject1 = Subject.find(1)
subject2 = Subject.find(2)
subject3 = Subject.find(3)
subject4 = Subject.find(4)
subject5 = Subject.find(5)
subject6 = Subject.find(6)

Channel.create!([ 
  {name:"PreCalculus", details: "Stuck on a tricky problem with Polynomial Functions was curious if anyone wants to walk thorugh it", user_id: user1.id, subject_id: subject1.id},
  {name:"Geometry", details: "Learned a new concept called proof did not understand it at all!", user_id: user2.id, subject_id: subject1.id},
  {name:"Algebra", details: "Just going over factoring quadratics wouldnt mind working with someone", user_id: user3.id, subject_id: subject1.id},
  {name:"Biology", details: "Studying for test on human body specifically cells", user_id: user4.id, subject_id: subject2.id},
  {name:"Physics", details: "Working on Kinematics and solving some problems can definitly use some help", user_id: user1.id, subject_id: subject2.id},
  {name:"Chemistry", details: "Going over periodic table trying to memorize!", user_id: user2.id, subject_id: subject2.id},
  {name:"Grammer", details: "Studying for SAT could use a partner", user_id: user3.id, subject_id: subject3.id},
  {name:"Vocabulary", details: "Test coming up got 300 words I got to learn", user_id: user4.id, subject_id: subject3.id},
  {name:"Sentance Structure", details: "Trying to perfect my sentances before I write a paper for my final", user_id: user1.id, subject_id: subject3.id},
  {name:"American Revolution", details: "Have a test going over some topics", user_id: user2.id, subject_id: subject4.id},
  {name:"Industrial Revolution", details: "working on a paper if anyone has a good topic", user_id: user3.id, subject_id: subject4.id},
  {name:"World War I", details: "Going over hat started the war and how it ended", user_id: user4.id, subject_id: subject4.id},
  {name:"Political systems/forms of government", details: "Ive got no clue what What political systems are can someone explain", user_id: user1.id, subject_id: subject5.id},
  {name:"State and government", details: "Going over the seperation between state and givernment and who has power when", user_id: user2.id, subject_id: subject5.id},
  {name:"Democracy", details: "United States is the best!", user_id: user3.id, subject_id: subject5.id},
  {name:"The Wheather", details: "Why does it always rain whereever I go?", user_id: user4.id, subject_id: subject6.id},
  {name:"Miami Dolphins", details: "Actually preparing for Fantasy Draft just wanted to go over the Dolphins roster", user_id: user1.id, subject_id: subject6.id},
  {name:"Fish Recipe", details: "Anyone got any good recipes?", user_id: user2.id, subject_id: subject6.id},
])

channel1 = Channel.find(1)
channel2 = Channel.find(2)
channel3 = Channel.find(3)
channel4 = Channel.find(4)
channel5 = Channel.find(5)
channel6 = Channel.find(6)
channel7 = Channel.find(7)
channel8 = Channel.find(8)
channel9 = Channel.find(9)
channel10 = Channel.find(10)
channel11 = Channel.find(11)
channel12 = Channel.find(12)
channel13 = Channel.find(13)
channel14 = Channel.find(14)
channel15 = Channel.find(15)
channel16 = Channel.find(16)
channel17 = Channel.find(17)
channel18 = Channel.find(18)



Conversation.create!([ 
  {sender_id: user1.id,recipient_id: user2.id},
  {sender_id: user2.id,recipient_id: user3.id},
  {sender_id: user3.id,recipient_id: user1.id}
])

conversation1 = Conversation.find(1)
conversation2 = Conversation.find(2)
conversation3 = Conversation.find(3)

Message.create!([ 
  {text:"Hey just leanred that what functions specifically are you going over are you going over?", user_id: user2.id, channel_id: channel1.id },
  {text:"Honestly just need a walk through not sure what its called", user_id: user1.id, channel_id: channel1.id },
  {text:"ok ill message you we can go over it", user_id: user2.id, channel_id: channel1.id },
  {text:"I migth be able to explain it to you im in middle of learning that as well", user_id: user3.id, channel_id: channel2.id },
  {text:"that would be amazing if you can message me when you have a chance", user_id: user2.id, channel_id: channel2.id },
  {text:"im free would love a partner", user_id: user4.id, channel_id: channel3.id },
  {text:"cool you finding it hard or easy?", user_id: user3.id, channel_id: channel3.id },
  {text:"that topic grosses me out honestly but have ti get it done", user_id: user1.id, channel_id: channel4.id },
  {text:"yeah same but two heads ar always betterr than one", user_id: user4.id, channel_id: channel4.id },
  {text:"When do you lkearn that?", user_id: user3.id, channel_id: channel5.id },
  {text:"My school is 11th grade have no clue whats going on", user_id: user1.id, channel_id: channel5.id },
  {text:"Having any luck i heard there are some songs", user_id: user4.id, channel_id: channel6.id },
  {text:"yeah im looking for some if you know any", user_id: user2.id, channel_id: channel6.id },
  {text:"im also studying for the SAT could use some help in other places", user_id: user2.id, channel_id: channel7.id },
  {text:"yeah sure id ont mind studying other things we can do a whole bunch", user_id: user3.id, channel_id: channel7.id },
  {text:"not sure if I know any but you can throw some words my way and ill let you know ", user_id: user1.id, channel_id: channel8.id },
  {text:"ill just send you the list and ill let you know any tips to remember them", user_id: user4.id, channel_id: channel8.id },
  {text:"what specifically are you trying to perfect", user_id: user3.id, channel_id: channel9.id },
  {text:"just need someone to proof read maybe tell me where to improve", user_id: user1.id, channel_id: channel9.id },
  {text:"i can give you some good resources too look at", user_id: user4.id, channel_id: channel10.id },
  {text:"that would be amazing dont have good notes from class", user_id: user1.id, channel_id: channel10.id },
  {text:"you mean specific topic on the revolution?", user_id: user4.id, channel_id: channel11.id },
  {text:"yeah not very creative so I can use some ideas", user_id: user2.id, channel_id: channel11.id },
  {text:"i did a paper on that once could be good to refresh my memory", user_id: user1.id, channel_id: channel12.id },
  {text:"if you have time that would be great", user_id: user3.id, channel_id: channel12.id },
  {text:"that can take hours my man", user_id: user3.id, channel_id: channel13.id },
  {text:"just a basic overview so im not lost in class", user_id: user4.id, channel_id: channel13.id },
  {text:"i have some interesting takes if you want to hear", user_id: user3.id, channel_id: channel14.id },
  {text:"sure you mind if include it in my paper", user_id: user1.id, channel_id: channel14.id },
  {text:"that is definitly true my friend", user_id: user3.id, channel_id: channel15.id },
  {text:"who you voting for this election", user_id: user2.id, channel_id: channel15.id },
  {text:"because you have a magnetic field on your head thats attracting all the storms", user_id: user2.id, channel_id: channel16.id },
  {text:"for real?", user_id: user3.id, channel_id: channel16.id },
  {text:"thats my favortie team they had an amzing draft", user_id: user1.id, channel_id: channel17.id },
  {text:"they had soemthing crazy like 12 draft picks no?", user_id: user4.id, channel_id: channel17.id },
  {text:"do you like spicy food", user_id: user3.id, channel_id: channel18.id },
  {text:"nothing to spicy but hit me with it ill let you know what i think!", user_id: user1.id, channel_id: channel18.id },
  {text:"Hey whats up you have time now?", user_id: user2.id, conversation_id: conversation1.id },
  {text:"example message", user_id: user3.id, conversation_id: conversation2.id },
  {text:"I can really youse help with that problem", user_id: user1.id, conversation_id: conversation3.id },
])
