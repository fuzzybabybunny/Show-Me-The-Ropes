class Guide < ActiveRecord::Base

  belongs_to :user
  has_many :guide_messages
  has_many :guide_reviews
  has_many :rookie_reviews
  has_many :pins
  dependent: :destroy

end

