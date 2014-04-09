class Rookie < ActiveRecord::Base
  belongs_to :user
  attr_accessor :person_id, :rookie_experience

end