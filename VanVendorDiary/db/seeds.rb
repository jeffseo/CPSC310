# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
User.create!(name:  "Example User",
             email: "example@vvd.org",
             password:              "foobar",
             password_confirmation: "foobar",
             activated: true,
             activated_at: Time.zone.now.to_datetime)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@vvd.org"
  password = "password"
  User.create!(name:                  name,
               email:                 email,
               password:              password,
               password_confirmation: password,
               activated:             true,
               activated_at:          Time.zone.now.to_datetime)
end

vendor_num=1
50.times do 
Vendor.create!(key:           vendor_num ,
               vendor_type:   "Fast Food",
               status:        "open",
               business_name: "Not specified",
               location:      "Not specified",
               description:   "Not Specified",
               lat:           "10",
               lon:           "10")
vendor_num = vendor_num + 1
end

users = User.order(:created_at).take(6)
vendor_num = 1
50.times do
  content = Faker::Lorem.sentence(5)
  vendor = Vendor.find(vendor_num)
  vendor_num = vendor_num + 1
  users.each { |user| user.comments.create!(content: content, vendor_id: vendor.id) }
end
