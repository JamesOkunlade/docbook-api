class User < ApplicationRecord
    # encrypt password
    has_secure_password

    # Associations
    has_many :appointments, dependent: :destroy
    has_many :doctors, through: :appointments

    # Validations
    validates_presence_of :name, :email, :password_digest
end
