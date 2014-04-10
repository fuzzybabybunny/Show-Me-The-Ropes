collection @guides, root: :guides

attributes :id, :user_id
attributes :id, :guide_experience

node :href do |guide|
  guide_url(guide)
end