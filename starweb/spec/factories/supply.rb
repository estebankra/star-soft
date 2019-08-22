# frozen_string_literal: true
FactoryBot.define do
  factory :supply do
    name          { Faker::Commerce.product_name }
    stock         { Faker::Number.within(range: 1..100) }
    description   { Faker::Lorem.paragraph }
  end
end