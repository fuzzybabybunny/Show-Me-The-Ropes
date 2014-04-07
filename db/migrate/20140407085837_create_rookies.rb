class CreateRookies < ActiveRecord::Migration
  def change
    create_table :rookies do |t|
      t.string :rookie_id
      t.string :experience

      t.timestamps
    end
  end
end
