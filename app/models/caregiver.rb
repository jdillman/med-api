class Caregiver < ApplicationRecord
  has_one :person, as: :personable

  delegate :account, :to => :person
end
