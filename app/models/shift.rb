# frozen_string_literal: true

class Shift < ApplicationRecord
  belongs_to :account
  belongs_to :caregiver

  has_many :visits
end
