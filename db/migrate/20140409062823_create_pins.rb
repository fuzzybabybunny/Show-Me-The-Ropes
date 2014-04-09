class CreatePins < ActiveRecord::Migration
  def change
    create_table :pins do |t|
      t.string :lat
      t.string :long
      t.string :guideID
      t.string :activity
      t.string :description

      t.timestamps
    end
  end
end
