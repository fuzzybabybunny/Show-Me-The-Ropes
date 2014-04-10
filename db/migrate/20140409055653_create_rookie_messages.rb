class CreateRookieMessages < ActiveRecord::Migration
  def change
    create_table :rookie_messages do |t|
      t.integer :rookie_id
      t.integer :guide_id
      t.string :message

      t.timestamps
    end
  end
end
