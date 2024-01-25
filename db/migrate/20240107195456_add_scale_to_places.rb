class AddScaleToPlaces < ActiveRecord::Migration[7.0]
  def change
    change_column :places, :latitude, :decimal, precision: 5, scale: 2
    change_column :places, :longitude, :decimal, precision: 5, scale: 2
  end
end
