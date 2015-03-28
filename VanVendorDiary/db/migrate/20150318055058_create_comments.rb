class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.references :user
      t.references :vendor
      t.timestamps null: false
    end
    add_foreign_key :comments, :users
    add_index :comments, [:user_id, :created_at] 
    add_index :comments, [:vendor_id, :created_at]
  end
end
