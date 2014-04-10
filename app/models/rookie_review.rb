class RookieReview < ActiveRecord::Base
  belongs_to :guide
  belongs_to :rookie
end
