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