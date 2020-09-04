require 'rails_helper'

RSpec.describe Appointment, type: :model do
  # Association test
  # Ensure it belongs to doctor and user models
  it { should belong_to(:doctor) }
  it { should belong_to(:user) }

  # Validation test
  it { should validate_presence_of(:label) }
  it { should validate_presence_of(:date) }

end
