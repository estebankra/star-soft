# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create 50 Clients
50.times do
  Client.transaction do
    client = Client.create! :first_name => Faker::Name.first_name, :last_name => Faker::Name.last_name, :doc_ruc => Faker::Code.rut,
                            :phone => Faker::PhoneNumber.cell_phone, :date_nac  =>  Faker::Date.birthday(min_age: 18, max_age: 65),
                            :email => Faker::Internet.email, :city => Faker::Address.city, :country => Faker::Address.country
  end
end

# Create 30 sponsors
30.times do
  Sponsor.transaction do
    sponsor = Sponsor.create! :name => Faker::Company.name
  end
end

# Add images
Sponsor.all.each { |sponsor| sponsor.image = File.open(Dir['app/assets/images/*.jpg'].sample); sponsor.save! }

# Create 30 supplies
30.times do
  Supply.transaction do
    supply = Supply.create! :name => Faker::Commerce.product_name, :stock => Faker::Number.within(range: 1..100),
                              :description => Faker::Lorem.paragraph
  end
end

# Add images
Supply.all.each { |suply| suply.image = File.open(Dir['app/assets/images/*.jpg'].sample); suply.save! }

# Create 30 products
30.times do
  Product.transaction do
    product = Product.create! :name =>  Faker::Commerce.product_name, :price => Faker::Commerce.price(range: 5000..350000),
                              :description => Faker::Lorem.paragraph
  end
end

# Add images
Product.all.each { |product| product.image = File.open(Dir['app/assets/images/*.jpg'].sample); product.save! }

# For users of system
User.transaction do
  user = User.create! :first_name => Faker::Name.name, :last_name => Faker::Name.name, :email => 'admin@example.com',
                      :password => 'adminadmin', :password_confirmation => 'adminadmin',  :permission_level => 3
  user = User.create! :first_name => Faker::Name.name, :last_name => Faker::Name.name, :email => 'team@example.com',
                      :password => 'teamteam', :password_confirmation => 'teamteam',  :permission_level => 2
  user = User.create! :first_name => Faker::Name.name, :last_name => Faker::Name.name, :email => 'secretary@example.com',
                      :password => 'secretary', :password_confirmation => 'secretary',  :permission_level => 1
end