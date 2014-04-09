class Guide < ActiveRecord::Base
  belongs_to :user
  attr_accessor :person_id, :guide_experience

end

