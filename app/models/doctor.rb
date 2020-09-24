class Doctor < ApplicationRecord
  # Associations
  belongs_to :specialty
  has_many :appointments, dependent: :destroy
  has_many :users, through: :appointments

  # Validations
  validates_presence_of :name, :email, :license, :address, :info, :years_of_experience, :phone
end
