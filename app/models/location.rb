# frozen_string_literal: true

class Location < ApplicationRecord
  belongs_to :account

  has_many :visits
end
