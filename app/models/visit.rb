# frozen_string_literal: true

class Visit < ApplicationRecord
  belongs_to :account
  belongs_to :patient
  belongs_to :shift
  belongs_to :location
end
