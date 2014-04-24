object @guide

attributes :user_id
attributes :guide_experience


node :guide_first_name do |guide|
  guide.user.first_name
end

node :guide_last_name do |guide|
  guide.user.last_name
end

node :guide_rating do |guide|
  guide.guide_reviews.map{|review| review.rating}.reduce(:+) / guide.guide_reviews.size
end

node :guide_avatar do |guide|
  guide.user.avatar
end

node :guide_email do |guide|
  guide.user.email
end