# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# repeat for each user
user = User.create(name: "Beyonce", username: "QueenB", email: "Bey@Bey.com", avatar:"http://www.eonline.com/eol_images/Entire_Site/2013719/rs_600x600-130819130517-600.BeyonceBob.mh.081913.jpg", location: "The World, USA", website: "http://www.beyonce.com/", bio: "Running the world, one step at a time!", producer: true, rapper: true, singer: true, songwriter: true)
provider = Provider.create(provider_type: "vimeo", username: "Beyonce", user_id: user.id)
user.contents.create(user_id: 1, provider_id: provider.id, feedback: true, media_id: "24208562", title: "Run the World")
user.contents.create(user_id: 1, provider_id: provider.id, feedback: true, media_id: "82541445", title: "Beyonce 'Yonce'")

user2 = User.create(name: "Matthew Intreg", username: "Matthew Intreg", email: "Intreg@Intreg.com", avatar: "http://cdn.mhpbooks.com/uploads/2012/04/Bob-Dylan-illustration-001.jpeg", location: "Seattle, WA", website: "http://intregemarketing.com/", bio: "I love making illustrations. Let me know what you think?", animator: true, videographer: true, editor: true)

provider = Provider.create(provider_type: "vimeo", username: "Matthew Intreg", user_id: user2.id)

user2.contents.create(user_id: user2.id, provider_id: provider.id, feedback: true, collab: true, media_id: "92301646", title: "Rainbow")
user2.contents.create(user_id: user2.id, provider_id: provider.id, feedback: true, collab: true, media_id: "92224516", title: "The Lava")


user3 = User.create(name: "Andron Cross", username: "IzyBeats", email: "izybeats@facebook.com", avatar: "https://i3.sndcdn.com/avatars-000033283376-6abi1t-t500x500.jpg?28a3374", location: "Miami, FL", website: "https://www.facebook.com/pages/Izybeats/279394729512", bio: "Producer,Composer, Mixer One of Miami's top producers, izy beats, born and raised in jamaica, came to miami in 2002 and have bin dominating miami music scene ever since. you wont be disappointed with Izy on a project!!!! Check him out for your self and you be the judge. IZY ON DA BEAT!!", producer: true, videographer: true, editor: true, filmmaker: true)

provider = Provider.create(provider_type: "google_oauth2", username: "IzyBeats", user_id: user3.id)

user3.contents.create(user_id: user3.id, provider_id: provider.id, feedback: true, collab: true, media_id: "0worZgfGptE", title: "Izybeats South beat 2")
user3.contents.create(user_id: user3.id, provider_id: provider.id, feedback: true, collab: true, media_id: "N0J7hykBdPw", title: "Guitar 'Izy beats'")



