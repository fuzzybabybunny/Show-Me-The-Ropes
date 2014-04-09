collection @guide_reviews, root: :guide_reviews

attributes :id, :rookieID
attributes :id, :guideID
attributes :id, :textReview
attributes :id, :rating

node :href do |guide_review|
  guide_review_url(guide_review)
end