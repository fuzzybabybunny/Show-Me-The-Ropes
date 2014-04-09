# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all

temp_password = "1234"

u1 = User.create({ email: "victor@victorlinphoto.com", password: temp_password, password_confirmation: temp_password, first_name: "Victor", last_name: "Lin" })
u2 = User.create({ email: "mlee2569@gmail.com", password: temp_password, password_confirmation: temp_password, first_name: "Mu-Wah", last_name: "Lee" })
u3 = User.create({ email: "charlie@gmail.com", password: temp_password, password_confirmation: temp_password, first_name: "Charlie", last_name: "Morris" })

Guide.destroy_all

g1 = Guide.create({ userID: u1.id, guideExperience: "Skiing, Scuba" })
g2 = Guide.create({ userID: u2.id, guideExperience: "Hiking" })
g3 = Guide.create({ userID: u3.id, guideExperience: "Skiing" })

Rookie.destroy_all

r1 = Rookie.create({ userID: u1.id, rookieExperience: "Skiing, Hiking" })
r2 = Rookie.create({ userID: u2.id, rookieExperience: "Hiking, Scuba" })
r3 = Rookie.create({ userID: u3.id, rookieExperience: "Skiing, Hiking" })

GuideReview.destroy_all

gr1 = GuideReview.create({ rookieID: r1.id, guideID: g2.id, textReview: "Sucked.", rating: "1" })
gr2 = GuideReview.create({ rookieID: r2.id, guideID: g3.id, textReview: "Great.", rating: "5" })
gr3 = GuideReview.create({ rookieID: r3.id, guideID: g1.id, textReview: "Bad trip.", rating: "2" })

RookieReview.destroy_all

rr1 = RookieReview.create({ rookieID: r1.id, guideID: g2.id, textReview: "Dumb.", rating: "1" })
rr2 = RookieReview.create({ rookieID: r2.id, guideID: g3.id, textReview: "Awesome person.", rating: "5" })
rr3 = RookieReview.create({ rookieID: r3.id, guideID: g1.id, textReview: "Needs to do more drugs.", rating: "3" })

Pin.destroy_all

pin1 = Pin.create({ lat: "22.28", long: "114.2", guideID: g1.id, activity: "Skiing", description: "Mt. Tam shredding the gnar." })
pin2 = Pin.create({ lat: "22.285", long: " 114.23", guideID: g1.id, activity: "Scuba", description: "We're gunno drown here." })
pin3 = Pin.create({ lat: "22.277", long: "114.218", guideID: g2.id, activity: "Hiking", description: "Exercise yo." })
pin4 = Pin.create({ lat: "22.289", long: "114.11", guideID: g3.id, activity: "Skiing", description: "Picking up ski bunnies." })

RookieMessage.destroy_all

rm1 = RookieMessage.create({ rookieID: r1.id, guideID: g2.id, message: "When do you want to go?"})
rm2 = RookieMessage.create({ rookieID: r1.id, guideID: g2.id, message: "What's your email?"})
rm3 = RookieMessage.create({ rookieID: r1.id, guideID: g2.id, message: "Mine's admin@example.com"})

GuideMessage.destroy_all

gm1 = GuideMessage.create({ rookieID: r1.id, guideID: g2.id, message: "4PM"})
gm2 = GuideMessage.create({ rookieID: r1.id, guideID: g2.id, message: "admin@example.com"})
gm3 = GuideMessage.create({ rookieID: r1.id, guideID: g2.id, message: "Thanks"})