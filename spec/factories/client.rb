# frozen_string_literal: true
FactoryBot.define do
  factory :client do
    first_name        { Faker::Name.first_name }
    last_name         { Faker::Name.last_name }
    doc_ruc           { Faker::Code.rut }
    phone             { Faker::PhoneNumber.cell_phone }
    date_nac          { Faker::Date.birthday(min_age: 18, max_age: 65) }
    email             { Faker::Internet.email }
    city              { Faker::Address.city }
    country           { Faker::Address.country }
  end
end