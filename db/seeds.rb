# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user1 = User.create(first_name:"test", last_name: "user1", email:"testemailocal@gasdsa.com", password: "localtesf12w31231paswsword")
user2 = User.create(first_name:"second", last_name: "last2", email:"seconduser@gasdsa.com", password: "locdsfsdafsdfs1paswsword")

friend1 = Friend.create(first_name:"friend1", last_name: "last1", email:"firstfriendilocal@gasdsa.com", phone:"123-456-7890")
friend2 = Friend.create(first_name:"friend2", last_name: "last2", email:"secondfriendilocal@gasdsa.com", phone:"555-456-7890")

event1 = user1.events.build(location:"test location1", title:"first test event", event_time: DateTime.now + 3)
event1.friend = friend1
event1.save
event2 = user2.events.build(location:"test location2", title:"second test event", event_time: DateTime.now + 5)
event2.friend = friend2
event2.save

user1.friends << friend1
user2.friends << friend2

comment1 = Comment.create(content:"test comment 1", user_id: user1.id, event_id: event1.id)
comment2 = Comment.create(content:"test comment 2", user_id: user2.id, event_id: event2.id)