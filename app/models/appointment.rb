class Appointment < ApplicationRecord
  # Associations
  belongs_to :doctor
  belongs_to :user

  # Validations
  validates_presence_of :label, :date
end
