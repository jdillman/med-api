# frozen_string_literal: true

class Caregiver < ApplicationRecord
  has_one :person, as: :personable
  has_many :shifts

  delegate :account, to: 'person'
end
