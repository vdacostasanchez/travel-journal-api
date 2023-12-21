class CreatePlaces < ActiveRecord::Migration[7.0]
  def change
    create_table :places do |t|
      t.integer :user_id
      t.integer :trip_id
      t.string :name
      t.date :date
      t.string :address

      t.timestamps
    end
  end
end
