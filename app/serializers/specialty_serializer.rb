class SpecialtySerializer < ActiveModel::Serializer
    # attributes to be serialized  
    attributes :id, :area_of_specialization, :created_at, :updated_at
    # model association
    has_many :doctors
end
  
  
  