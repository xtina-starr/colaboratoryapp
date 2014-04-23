# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# repeat for each user
user = User.create(name: "Beyonce", username: "QueenB", email: "Bey@Bey.com", avatar:"http://www.eonline.com/eol_images/Entire_Site/2013719/rs_600x600-130819130517-600.BeyonceBob.mh.081913.jpg", location: "The World, USA", website: "http://www.beyonce.com/", bio: "Running the world, one step at a time!", producer: true, rapper: true, singer: true, songwriter: true)
Provider.create(provider_type: "vimeo", username: "Beyonce", user_id: user.id)
user.contents.create(user_id: 1, provider_id: 1, feedback: true, media_id: "24208562", title: "Run the World")
user.contents.create(user_id: 1, provider_id: 1, feedback: true, media_id: "82541445", title: "Beyonce 'Yonce'")

user2 = User.create(name: "Matthew Intreg", username: "Matthew Intreg", email: "Intreg@Intreg.com", avatar: "http://cdn.mhpbooks.com/uploads/2012/04/Bob-Dylan-illustration-001.jpeg", location: "Seattle, WA", website: "http://intregemarketing.com/", bio: "I love making illustrations. Let me know what you think?", animator: true, videographer: true, editor: true)
Provider.create(provider_type: "vimeo", username: "Matthew Intreg", user_id: user2.id)
user2.contents.create(user_id: user2.id, provider_id: 1, feedback: true, collab: true, media_id: "92301646", title: "Rainbow")
user2.contents.create(user_id: user2.id, provider_id: 1, feedback: true, collab: true, media_id: "92224516", title: "The Lava")