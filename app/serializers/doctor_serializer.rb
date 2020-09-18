class DoctorSerializer < ActiveModel::Serializer
  # attributes to be serialized  
  attributes :id, :name, :license, :years_of_experience, :specialty_id, :info, :address, :avatar, :phone, :created_at, :updated_at
  # model association
  has_many :appointments
end


