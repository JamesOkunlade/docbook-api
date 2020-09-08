class User < ApplicationRecord
    # Associations
    has_many :appointments, dependent: :destroy
    has_many :doctors, through: :appointments

    # Validations
    validates_presence_of :name, :email
end
