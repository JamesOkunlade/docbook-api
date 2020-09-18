class UserSerializer < ActiveModel::Serializer
  # attributes to be serialized  
  attributes :id, :name, :email, :sex, :age, :avatar, :created_at, :updated_at, :phone, :location
  # model association
  has_many :appointments
end
