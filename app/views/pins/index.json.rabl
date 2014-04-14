collection @pins, root: :pins

attributes :id, :title
attributes :id, :long
attributes :id, :lat
attributes :id, :guide_id
attributes :id, :activity
attributes :id, :description

node :href do |pin|
  pin_url(pin)
end

node :first_name do |pin|
  pin.guide.user.first_name
end

node :last_name do |pin|
  pin.guide.user.last_name
end

node :rating do |pin|
  pin.guide.guide_reviews.map{|review| review.rating}.reduce(:+) / pin.guide.guide_reviews.size
end

node :guide_href do |pin|
  guide_url(pin.guide)
end