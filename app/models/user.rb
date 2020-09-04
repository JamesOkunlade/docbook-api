class User < ApplicationRecord
    # Associations
    has_many :appointments, dependent: :destroy

    # Validations
    validates_presence_of :name, :email
end
