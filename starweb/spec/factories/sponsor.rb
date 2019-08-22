# frozen_string_literal: true
FactoryBot.define do
  factory :sponsor do
    name { Faker::Company.name }
  end
end