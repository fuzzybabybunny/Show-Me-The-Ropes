class Rookie < ActiveRecord::Base

  belongs_to :user
  has_many :rookie_messages
  has_many :guide_reviews
  has_many :rookie_reviews

end
