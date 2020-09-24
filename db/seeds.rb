# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

specialization = ["allergist", "dermatologist", "ophthalmologist", "gynecologist", "cardiologist", "endocrinologist", "gastroenterologist"]
specialization.each do |i|
    Specialty.create(area_of_specialization: "#{i}" )
end

20.times do
    doctor = Doctor.create(name: Faker::Name.name,
                            email: Faker::Internet.email,
                            license: Faker::IDNumber.valid,
                            address: Faker::Address.full_address,
                            info: Faker::Lorem.paragraph,
                            years_of_experience: Faker::Number.number(digits: 2),
                            phone: Faker::PhoneNumber.phone_number_with_country_code,
                            avatar: Faker::Avatar.image(slug: "my-own-slug", size: "50x50", format: "jpg"),
                            specialty_id: rand(1..7)
     )
end

user = User.create(name: "James Okunlade", email: "james@gmail.com", password: "pass@123", password_confirmation: "pass@123")

5.times do
    Appointment.create(label: Faker::Lorem.sentence,
                        date: Faker::Time.forward(days: 5,  period: :evening, format: :long),
                        doctor_id: rand(1..20),
                        user_id: user.id
    )
end


