class CreatePins < ActiveRecord::Migration
  def change
    create_table :pins do |t|
      t.string :guide_id
      t.string :location
      t.string :activity
      t.string :description

      t.timestamps
    end
  end
end
