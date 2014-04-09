collection @guides, root: :guides

attributes :id, :userID
attributes :id, :guideExperience

node :href do |guide|
  guide_url(guide)
end