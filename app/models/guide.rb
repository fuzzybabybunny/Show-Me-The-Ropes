class Guide < ActiveRecord::Base
  belongs_to :user
  attr_accessor :userID, :guideExperience

end

