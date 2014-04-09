class CreatePins < ActiveRecord::Migration
  def change
    create_table :pins do |t|
      t.float :lat
      t.float :long
      t.integer :guide_id
      t.string :activity
      t.string :description

      t.timestamps
    end
  end
end
