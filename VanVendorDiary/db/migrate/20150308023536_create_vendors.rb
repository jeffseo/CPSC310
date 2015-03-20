class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.string :key
      t.string :vendor_type
      t.string :status
      t.string :business_name
      t.string :location
      t.string :description
      t.float :lat
      t.float :lon
      t.timestamps null: false
    end
  end
end
