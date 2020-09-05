require 'faker'

FactoryBot.define do
    factory :specialty do
        area_of_specialization { Faker::Lorem.word }
    end
end