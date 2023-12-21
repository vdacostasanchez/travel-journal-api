class CreateImages < ActiveRecord::Migration[7.0]
  def change
    create_table :images do |t|
      t.integer :user_id
      t.integer :trip_id
      t.date :date
      t.string :img_url

      t.timestamps
    end
  end
end
