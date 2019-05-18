# frozen_string_literal: true

class Person < ApplicationRecord
  belongs_to :personable, polymorphic: true

  belongs_to :account
end
