require 'rails_helper'

RSpec.describe Doctor, type: :model do
  # Association test
  # Ensure it has 1:m relationship with the Appointment model
  # Ensure it belongs to the Specialty model
  it { should have_many(:appointments).dependent(:destroy) }
  it { should belong_to(:specialty) }

  # Validation test
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:license) }
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:info) }
  it { should validate_presence_of(:years_of_experience) }
  it { should validate_presence_of(:phone) }
end
