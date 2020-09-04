require 'rails_helper'

RSpec.describe User, type: :model do
  # Association test
  # Ensure User has a 1:m relationship with the Appointment model
  it { should have_many(:appointments).dependent(:destroy) }

  # Validation test
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
end
