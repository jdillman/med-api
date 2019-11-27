class AccountSerializer < ActiveModel::Serializer
  attributes :active, :active_at, :created_at, :id, :name, :updated_at
  has_many :locations
end
