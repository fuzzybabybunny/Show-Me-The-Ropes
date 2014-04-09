class CreateRookieReviews < ActiveRecord::Migration
  def change
    create_table :rookie_reviews do |t|
      t.integer :rookie_id
      t.integer :guide_id
      t.string :textReview
      t.integer :rating

      t.timestamps
    end
  end
end
