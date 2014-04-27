class Pin < ActiveRecord::Base

  belongs_to :guide
  dependent: :destroy

end
