class Person < ApplicationRecord
  belongs_to :account
  belongs_to :person_type

end
