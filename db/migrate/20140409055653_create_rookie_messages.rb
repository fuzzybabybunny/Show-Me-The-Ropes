class CreateRookieMessages < ActiveRecord::Migration
  def change
    create_table :rookie_messages do |t|
      t.string :rookieID
      t.string :guideID
      t.string :message

      t.timestamps
    end
  end
end
