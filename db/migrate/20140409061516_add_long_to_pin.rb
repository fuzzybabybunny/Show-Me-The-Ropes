class AddLongToPin < ActiveRecord::Migration
  def change
    add_column :long, :float
  end
end
