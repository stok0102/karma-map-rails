class AddLatitudeAndLongitudeToDeeds < ActiveRecord::Migration[5.0]
  def change
    add_column :deeds, :latitude, :float
    add_column :deeds, :longitude, :float
  end
end
