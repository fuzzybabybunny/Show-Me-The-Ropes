class CreateRookies < ActiveRecord::Migration
  def change
    create_table :rookies do |t|
      t.integer :person_id
      t.string :rookie_experience

      t.timestamps
    end
  end
end
