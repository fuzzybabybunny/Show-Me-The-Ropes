collection @rookies, root: :rookies

attributes :id, :user_id
attributes :id, :rookie_experience

node :href do |rookie|
  rookie_url(rookie)
end