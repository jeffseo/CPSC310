class CreateOmniauthusers < ActiveRecord::Migration
  def change
    create_table :omniauthusers do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :image
      t.string :token
      t.timestamps null: false
    end
  end
end
