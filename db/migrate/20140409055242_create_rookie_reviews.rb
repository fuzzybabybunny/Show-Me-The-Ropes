class CreateRookieReviews < ActiveRecord::Migration
  def change
    create_table :rookie_reviews do |t|
      t.string :rookieID
      t.string :guideID
      t.string :textReview
      t.string :rating

      t.timestamps
    end
  end
end
