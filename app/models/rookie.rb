class Rookie < ActiveRecord::Base
  belongs_to :user
  attr_accessor :userID, :rookieExperience

end