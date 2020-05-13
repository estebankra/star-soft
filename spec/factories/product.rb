# frozen_string_literal: true
FactoryBot.define do
  factory :product do
    name          { Faker::Commerce.product_name }
    price         { Faker::Commerce.price(range: 5000..350000) }
    description   { Faker::Lorem.paragraph }
  end
end