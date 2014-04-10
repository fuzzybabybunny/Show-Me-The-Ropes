class CreateRookies < ActiveRecord::Migration
  def change
    create_table :rookies do |t|
      t.integer :user_id
      t.string :rookie_experience

      t.timestamps
    end
  end
end
