class Caregiver < ApplicationRecord
  has_one :person, as: :personable
end
