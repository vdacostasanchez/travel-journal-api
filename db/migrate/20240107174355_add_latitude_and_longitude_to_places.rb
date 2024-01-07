class AddLatitudeAndLongitudeToPlaces < ActiveRecord::Migration[7.0]
  def change
    add_column :places, :latitude, :decimal, precision: 4
    add_column :places, :longitude, :decimal, precision: 4
  end
end
