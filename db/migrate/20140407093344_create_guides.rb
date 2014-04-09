class CreateGuides < ActiveRecord::Migration
  def change
    create_table :guides do |t|
      t.integer :person_id
      t.string :guide_experience

      t.timestamps
    end
  end
end
