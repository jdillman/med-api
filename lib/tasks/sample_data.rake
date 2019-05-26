# frozen_string_literal: true

require 'faker'

namespace :db do
  desc 'Drop, create, migrate, seed and populate sample data'
  task prepare: [:drop, :create, 'schema:load', :seed, :populate_sample_data] do
    puts 'Ready to go!'
  end

  desc 'Populates the database with sample data'
  task populate_sample_data: :environment do
    create_accounts(3).each do |account|
      create_people(account, 200)
      create_shifts(account, 50)
      create_locations(account, 100)
      create_visits(account, 100)
    end
  end
end

def create_locations(account, count)
  puts 'Creating sample Locations'

  locations = []
  count.times do
    locations << Location.create!(
      account: account,
      name: Faker::Company.name,
      city: Faker::Address.city,
      state: Faker::Address.state,
      zip: Faker::Address.zip,
      address: Faker::Address.street_address
    )
  end

  puts ''
  puts 'Finished creating Locations'

  locations
end

def create_people(account, count)
  puts 'Creating sample People'

  people = []
  count.times do
    if rand(1..10) > 2
      personable = Caregiver.create!(
        license_id: Faker::IDNumber.spanish_citizen_number
      )
      print '.'
    else
      personable = Patient.create!(
        admitted_at: Faker::Date.between(11.years.ago, Date.today)
      )
      print '*'
    end

    people << Person.create!(
      account: account,
      email: Faker::Internet.email,
      name: Faker::Name.name,
      birth_date: Faker::Date.birthday(1, 120),
      personable: personable
    )
  end

  puts ''
  puts 'Finished creating People!'

  people
end

# TODO random shift count per caregiver
def create_shifts(account, count)
  puts 'Creating sample Shifts'

  caregivers = Person.where(account: account).where(personable_type: 'Caregiver').limit(count)

  shifts = []
  caregivers.each do |caregiver|
    start_time = Faker::Date.between(2.years.ago, Date.yesterday)
    end_time = Faker::Date.between(start_time, Date.today)
    shifts << Shift.create!(
      account: account,
      caregiver: caregiver.personable,
      start_time: start_time,
      end_time: end_time
    )
    print '.'
  end

  puts ''
  puts 'Finished creating Shifts!'

  shifts
end

# TODO random visit count per shift
def create_visits(account, count)
  puts 'Creating sample Visits'

  patients = Person.where(account: account).where(personable_type: 'Patient').limit(count)

  patients.each do |patient|
    Visit.create!(
      account: account,
      patient: patient.personable,
      shift: Shift.where(account: account).first,
      location: Location.where(account: account).first
    )

    print '.'
  end

  puts ''
  puts 'Finished creating Visits'
end

def create_accounts(count)
  puts 'Creating sample Accounts'

  accounts = []
  count.times do
    account = Account.create!(name: Faker::Company.name)

    User.create!(
      account: account,
      email: Faker::Internet.email,
      name: Faker::Company.name,
      password: 'sample_user'
    )

    accounts << account
  end

  puts ''
  puts 'Finished creating Accounts'

  accounts
end
