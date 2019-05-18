# frozen_string_literal: true

class Patient < ApplicationRecord
  has_one :person, as: :personable

  delegate :account, :to => :person
end
