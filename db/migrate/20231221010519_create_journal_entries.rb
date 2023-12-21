class CreateJournalEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :journal_entries do |t|
      t.string :title
      t.date :date
      t.text :entry
      t.integer :trip_id
      t.integer :user_id
      t.boolean :public

      t.timestamps
    end
  end
end
