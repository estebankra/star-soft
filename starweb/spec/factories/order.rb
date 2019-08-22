# frozen_string_literal: true
FactoryBot.define do
  factory :order do
    deliver_date  { Faker::Date }
    paid          { Faker::Lorem.paragraph }
    course_club   { Faker::Lorem.paragraph }
    state         { Faker::Lorem.paragraph }
    notes         { Faker::Lorem.paragraph }
  end
end