FactoryBot.define do
    factory :appointment do
        label { Faker::Lorem.sentence }
        date { Faker::Time.forward(days: 5,  period: :evening, format: :long) }
        doctor
        user
    end
end