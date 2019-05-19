# frozen_string_literal: true

class Account < ApplicationRecord
  has_many :users
  has_many :people
  has_many :shifts
  has_many :locations

  validates :name, presence: true, length: { maximum: 50 }
end
