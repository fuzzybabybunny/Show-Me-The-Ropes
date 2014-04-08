class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :review_ID
      t.string :reviewer
      t.string :reviewee
      t.string :review
      t.string :rating

      t.timestamps
    end
  end
end
