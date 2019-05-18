# frozen_string_literal: true

require 'faker'

namespace :db do
  desc 'Drop, create, migrate, seed and populate sample data'
  task prepare: [:drop, :create, 'schema:load', :seed, :populate_sample_data] do
    puts 'Ready to go!'
  end

  desc 'Populates the database with sample data'
  task populate_sample_data: :environment do
    account = create_accounts(1)

    create_people(account, 400)

    shifts = create_shifts(account, Caregiver.random_records(30))

    create_visits(account, shifts, 100)

    # TODO Plug in FE when you get to this point
  end
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
def create_shifts(account, caregivers)
  puts 'Creating sample Shifts'

  shifts = []
  caregivers.each do |caregiver|
    start_time = Faker::Date.between(2.years.ago, Date.yesterday)
    end_time = Faker::Date.between(start_time, Date.today)
    shifts << Shift.create!(
      account: account,
      caregiver: caregiver,
      start_time: start_time,
      end_time: end_time
    )
    print '.'
  end
  
  puts ''
  puts 'Finished creating Shifts!'

  shifts
end

def create_visits(account, shifts, count)
  puts 'Creating sample Visits'

  count.times do
    print '.'
  end

  puts ''
  puts 'Finished creating Visits'
end

def create_accounts(count)
  accounts = []
  count.times do
    account = Account.create!(name: Faker::Company.name)

    User.create!(
      account: account,
      email: Faker::Internet.email,
      name: Faker::Name.name,
      password: 'sample_user'
    )

    accounts << account
  end

  if count == 1
    accounts.first
  else
    accounts
  end
end
