# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all

temp_password = "1234"

u1 = User.create({
    email: "victor@victorlinphoto.com",
    password: temp_password,
    password_confirmation: temp_password,
    first_name: "Victor",
    last_name: "Lin"
  })
u2 = User.create({
    email: "mlee2569@gmail.com",
    password: temp_password,
    password_confirmation: temp_password,
    first_name: "Mu-Wah",
    last_name: "Lee"
  })
u3 = User.create({
    email: "charlie@gmail.com",
    password: temp_password,
    password_confirmation: temp_password,
    first_name: "Charlie",
    last_name: "Morris"
  })

Guide.destroy_all

g1 = Guide.create({
    user_id: u1.id,
    guide_experience: "Lives to ski. Loves to scuba, but can't swim"
  })
g2 = Guide.create({
    user_id: u2.id,
    guide_experience: "Prefers to keep feet firmly on the ground"
  })
g3 = Guide.create({
    user_id: u3.id,
    guide_experience: "Expert skiier that writes for the Huffington Post."
  })

Rookie.destroy_all

r1 = Rookie.create({
    user_id: u1.id,
    rookie_experience: "Skiing, Hiking"
  })
r2 = Rookie.create({
    user_id: u2.id,
    rookie_experience: "Hiking, Scuba"
  })
r3 = Rookie.create({
    user_id: u3.id,
    rookie_experience: "Skiing, Hiking"
  })

GuideReview.destroy_all

gr1 = GuideReview.create({
    rookie_id: r1.id,
    guide_id: g2.id,
    textReview: "Sucked.",
    rating: "1"
  })
gr2 = GuideReview.create({
    rookie_id: r2.id,
    guide_id: g3.id,
    textReview: "Great.",
    rating: "5"
  })
gr3 = GuideReview.create({
    rookie_id: r3.id,
    guide_id: g1.id,
    textReview: "Bad trip.",
    rating: "2"
  })

RookieReview.destroy_all

rr1 = RookieReview.create({
    rookie_id: r1.id,
    guide_id: g2.id,
    textReview: "Dumb.",
    rating: "1"
  })
rr2 = RookieReview.create({
    rookie_id: r2.id,
    guide_id: g3.id,
    textReview: "Awesome person.",
    rating: "5"
  })
rr3 = RookieReview.create({
    rookie_id: r3.id,
    guide_id: g1.id,
    textReview: "Needs to do more drugs.",
    rating: "3"
  })

Pin.destroy_all

pin1 = Pin.create({
    lat:          "22.28",
    long:         "114.2",
    guide_id:     g1.id,
    activity:     "Skiing",
    description:  "Mt. Tam shredding the gnar.",
    title:        "Awesome skiing"
  })
pin2 = Pin.create({
    lat:          "22.285",
    long:         "114.23",
    guide_id:     g1.id,
    activity:     "Scuba",
    description:  "We're gunno drown here.",
    title:        "A fishy dive"
  })
pin3 = Pin.create({
    lat:          "22.277",
    long:         "114.218",
    guide_id:     g2.id,
    activity:     "Hiking",
    description:  "Exercise yo.",
    title:        "A fast Hike"
  })
pin4 = Pin.create({
    lat:          "28.323",
    long:         "85.319",
    guide_id:     g2.id,
    activity:     "Hiking",
    description:  "Fully supported, 9 day hike.",
    title:        "Trek the Himalayan Foothills"
  })

pin5 = Pin.create({
    lat:          "22.289",
    long:         "114.11",
    guide_id:     g3.id,
    activity:     "Skiing",
    description:  "Picking up ski bunnies.",
    title:        "Black Runs!"
  })

pin6 = Pin.create({
    lat:          "-16.699",
    long:         "145.947",
    guide_id:     g3.id,
    activity:     "Scuba",
    description:  "So many tropical fish.",
    title:        "Swim with Nemo"
  })

pin7 = Pin.create({
    lat:          "-44.378",
    long:         "168.725",
    guide_id:     g3.id,
    activity:     "Skiing",
    description:  "Great place to learn to ski.",
    title:        "What a view!"
  })

pin8 = Pin.create({
    lat:          "41.162",
    long:         "16.875",
    guide_id:     g3.id,
    activity:     "Windsurfing",
    description:  "Fantstic beaches",
    title:        "Italian southcoast fun"
  })

pin9 = Pin.create({
    lat:          "31.840",
    long:         "-8.129",
    guide_id:     g2.id,
    activity:     "Sandboarding",
    description:  "Endless dunes.",
    title:        "Big dunes."
  })

pin10 = Pin.create({
    lat:          "51.227",
    long:         "-115.565",
    guide_id:     g1.id,
    activity:     "Skiing",
    description:  "Banff, Lake Louise, Jasper.",
    title:        "Rocky Mountain Skiing"
  })

pin11 = Pin.create({
    lat:          "80.703",
    long:         "-45.351",
    guide_id:     g1.id,
    activity:     "Skiing",
    description:  "Lost.",
    title:        "In the middle of nowhere."
  })

pin12 = Pin.create({
    lat:          "22.215",
    long:         "114.184",
    guide_id:     g2.id,
    activity:     "Hiking",
    description:  "A must hike for visitors and locals alike.",
    title:        "Dragon's Back"
  })

pin13 = Pin.create({
    lat:          "22.405",
    long:         "114.324",
    guide_id:     g2.id,
    activity:     "Hiking",
    description:  "Stage 1 out of 10.",
    title:        "MacLehose Stage 1"
  })

pin14 = Pin.create({
    lat:          "22.391",
    long:         "114.293",
    guide_id:     g1.id,
    activity:     "Scuba",
    description:  "See them before they become extinct.",
    title:        "Pink Dolphins."
  })

pin15 = Pin.create({
    lat:          "-15.644",
    long:         "49.790",
    guide_id:     g1.id,
    activity:     "Scuba",
    description:  "I want to move it, move it.",
    title:        "Madagascar....!"
  })

pin16 = Pin.create({
    lat:          "-50.687",
    long:         "-73.707",
    guide_id:     g2.id,
    activity:     "Hiking",
    description:  "You can touch an iceberg.",
    title:        "Torres del Paine"
  })

pin17 = Pin.create({
    lat:          "21.497",
    long:         "-157.815",
    guide_id:     g1.id,
    activity:     "Longboarding",
    description:  "Aloha!",
    title:        "Magnum PI"
  })

pin18 = Pin.create({
    lat:          "6.170",
    long:         "116.622",
    guide_id:     g2.id,
    activity:     "Hiking",
    description:  "2 days, up and down, then see orangutans.",
    title:        "Highest Peak in SE Asia"
  })

pin19 = Pin.create({
    lat:          "24.906",
    long:         "-77.783",
    guide_id:     g1.id,
    activity:     "Scuba",
    description:  "Surf, sea and ...",
    title:        "Coconuts!"
  })

pin20 = Pin.create({
    lat:          "46.008",
    long:         "9.709",
    guide_id:     g3.id,
    activity:     "Skiing",
    description:  "Ski with the rich and famous.",
    title:        "On the Piste"
  })

pin21 = Pin.create({
    lat:          "65.766",
    long:         "-167.255",
    guide_id:     g2.id,
    activity:     "Hiking",
    description:  "You can see Russia from here.",
    title:        "Palin country."
  })


RookieMessage.destroy_all

rm1 = RookieMessage.create({
    rookie_id: r1.id,
    guide_id: g2.id,
    message: "When do you want to go?"
  })
rm2 = RookieMessage.create({
    rookie_id: r1.id,
    guide_id: g2.id,
    message: "What's your email?"
  })
rm3 = RookieMessage.create({
    rookie_id: r1.id,
    guide_id: g2.id,
    message: "Mine's admin@example.com"
  })

GuideMessage.destroy_all

gm1 = GuideMessage.create({
    rookie_id: r1.id,
    guide_id: g2.id,
    message: "4PM"
  })
gm2 = GuideMessage.create({
    rookie_id: r1.id,
    guide_id: g2.id,
    message: "admin@example.com"
  })
gm3 = GuideMessage.create({
    rookie_id: r1.id,
    guide_id: g2.id,
    message: "Thanks"
  })