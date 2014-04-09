class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :review_ID
      t.string :reviewer
      t.string :reviewee
      t.string :review
      t.integer :rating

      t.timestamps
    end
  end
end
