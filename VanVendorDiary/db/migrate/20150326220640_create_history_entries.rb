class CreateHistoryEntries < ActiveRecord::Migration
  def change
    create_table :history_entries do |t|
      t.belongs_to :user, index:true
      t.datetime :date_time
      t.references :user
      t.references :vendor
      t.timestamps null: false
    end
    add_index :history_entries, [:user_id, :created_at]
    add_index :history_entries, [:vendor_id, :created_at]
  end
end
