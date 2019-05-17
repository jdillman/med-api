class Patient < ApplicationRecord
  has_one :person, as: :personable
end
