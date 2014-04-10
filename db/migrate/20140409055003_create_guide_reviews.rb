class CreateGuideReviews < ActiveRecord::Migration
  def change
    create_table :guide_reviews do |t|
      t.integer :rookie_id
      t.integer :guide_id
      t.string :textReview
      t.integer :rating

      t.timestamps
    end
  end
end
