object @pin

attributes :title
attributes :long
attributes :lat
attributes :guide_id
attributes :activity
attributes :description

node :guide_first_name do |pin|
  pin.guide.user.first_name
end

node :guide_last_name do |pin|
  pin.guide.user.last_name
end

node :guide_rating do |pin|
  pin.guide.guide_reviews.map{|review| review.rating}.reduce(:+) / pin.guide.guide_reviews.size
end

node :guide_href do |pin|
  guide_url(pin.guide)
end

node :guide_avatar do |pin|
  pin.guide.user.avatar
end

node :guide_email do |pin|
  pin.guide.user.email
end

node :guide_experience do |pin|
  pin.guide.guide_experience
end