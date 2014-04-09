collection @guide_reviews, root: :guide_reviews

attributes :id, :rookie_id
attributes :id, :guide_id
attributes :id, :textReview
attributes :id, :rating

node :href do |guide_review|
  guide_review_url(guide_review)
end