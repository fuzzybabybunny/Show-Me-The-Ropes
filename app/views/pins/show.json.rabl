object @pin

attributes :title
attributes :long
attributes :lat
attributes :guide_id
attributes :activity
attributes :description

node :first_name do |pin|
  pin.guide.user.first_name
end

node :last_name do |pin|
  pin.guide.user.last_name
end