collection @rookies, root: :rookies

attributes :id, :rookie_id
attributes :id, :experience

node :href do |rookie|
  rookie_url(rookie)
end