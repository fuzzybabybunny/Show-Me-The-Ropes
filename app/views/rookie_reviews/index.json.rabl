collection @rookie_reviews, root: :rookie_reviews

attributes :id, :rookieID
attributes :id, :guideID
attributes :id, :textReview
attributes :id, :rating

node :href do |rookie_review|
  rookie_review_url(rookie_review)
end