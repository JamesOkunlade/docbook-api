require 'rails_helper'

RSpec.describe Specialty, type: :model do
  # Association test
  # Ensure Specialty has a 1:m association with the Doctor model
  it { should have_many(:doctors).dependent(:destroy) }

  # Validation test
  it { should validate_presence_of(:area_of_specialization) }
end
