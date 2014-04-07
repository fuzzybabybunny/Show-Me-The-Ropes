class CreateGuides < ActiveRecord::Migration
  def change
    create_table :guides do |t|
      t.string :guide_id
      t.string :experience

      t.timestamps
    end
  end
end
