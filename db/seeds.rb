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

g1 = Guide.create({ person_id: u1.id, guide_experience: "Skiing, Scuba" })
g2 = Guide.create({ person_id: u2.id, guide_experience: "Hiking" })
g3 = Guide.create({ person_id: u3.id, guide_experience: "Skiing" })

Rookie.destroy_all

r1 = Rookie.create({ person_id: u1.id, rookie_experience: "Skiing, Hiking" })
r2 = Rookie.create({ person_id: u2.id, rookie_experience: "Hiking, Scuba" })
r3 = Rookie.create({ person_id: u3.id, rookie_experience: "Skiing, Hiking" })

GuideReview.destroy_all

gr1 = GuideReview.create({ rookie_id: r1.id, guide_id: g2.id, textReview: "Sucked.", rating: "1" })
gr2 = GuideReview.create({ rookie_id: r2.id, guide_id: g3.id, textReview: "Great.", rating: "5" })
gr3 = GuideReview.create({ rookie_id: r3.id, guide_id: g1.id, textReview: "Bad trip.", rating: "2" })

RookieReview.destroy_all

rr1 = RookieReview.create({ rookie_id: r1.id, guide_id: g2.id, textReview: "Dumb.", rating: "1" })
rr2 = RookieReview.create({ rookie_id: r2.id, guide_id: g3.id, textReview: "Awesome person.", rating: "5" })
rr3 = RookieReview.create({ rookie_id: r3.id, guide_id: g1.id, textReview: "Needs to do more drugs.", rating: "3" })

Pin.destroy_all

pin1 = Pin.create({ lat: "22.28", long: "114.2", guide_id: g1.id, activity: "Skiing", description: "Mt. Tam shredding the gnar." })
pin2 = Pin.create({ lat: "22.285", long: " 114.23", guide_id: g1.id, activity: "Scuba", description: "We're gunno drown here." })
pin3 = Pin.create({ lat: "22.277", long: "114.218", guide_id: g2.id, activity: "Hiking", description: "Exercise yo." })
pin4 = Pin.create({ lat: "22.289", long: "114.11", guide_id: g3.id, activity: "Skiing", description: "Picking up ski bunnies." })

RookieMessage.destroy_all

rm1 = RookieMessage.create({ rookie_id: r1.id, guide_id: g2.id, message: "When do you want to go?"})
rm2 = RookieMessage.create({ rookie_id: r1.id, guide_id: g2.id, message: "What's your email?"})
rm3 = RookieMessage.create({ rookie_id: r1.id, guide_id: g2.id, message: "Mine's admin@example.com"})

GuideMessage.destroy_all

gm1 = GuideMessage.create({ rookie_id: r1.id, guide_id: g2.id, message: "4PM"})
gm2 = GuideMessage.create({ rookie_id: r1.id, guide_id: g2.id, message: "admin@example.com"})
gm3 = GuideMessage.create({ rookie_id: r1.id, guide_id: g2.id, message: "Thanks"})