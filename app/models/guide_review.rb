class GuideReview < ActiveRecord::Base
  belongs_to :rookie
  belongs_to :guide
end
