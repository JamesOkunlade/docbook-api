class Specialty < ApplicationRecord
    # Associations
    has_many :doctors, dependent: :destroy

    # Validations
    validates_presence_of :area_of_specialization
end
