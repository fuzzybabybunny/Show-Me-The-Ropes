class AddLatToPin < ActiveRecord::Migration
  def change
    add_column :lat, :float
  end
end
