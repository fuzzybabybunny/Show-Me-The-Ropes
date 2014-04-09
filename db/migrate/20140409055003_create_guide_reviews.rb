class CreateGuideReviews < ActiveRecord::Migration
  def change
    create_table :guide_reviews do |t|
      t.string :rookieID
      t.string :guideID
      t.string :textReview
      t.string :rating

      t.timestamps
    end
  end
end
