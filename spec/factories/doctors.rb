FactoryBot.define do
    factory :doctor do
        name { Faker::Name.name }
        email { Faker::Internet.email }
        license { Faker::IDNumber.valid }
        address { Faker::Address.full_address }
        info { Faker::Lorem.paragraph }
        years_of_experience { Faker::Number.number(digits: 2) }
        phone { Faker::PhoneNumber.phone_number_with_country_code }
        specialty
    end
end