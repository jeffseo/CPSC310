class CreateHistoryEntries < ActiveRecord::Migration
  def change
    create_table :history_entries do |t|
      t.datetime :date_time
      t.references :user
      t.references :vendor
      t.timestamps null: false
    end
    
    add_foreign_key :history_entries, :users
    add_foreign_key :history_entries, :vendors

    add_index :history_entries, [:user_id, :created_at]
    add_index :history_entries, [:vendor_id, :created_at]
  end
end
