require 'faker'

def create_people(account, count)
  puts 'Creating sample People'
  count.times {
    if rand(1..10) > 2
      personable = Caregiver.create!(
        license_id: Faker::IDNumber::spanish_citizen_number
      )
      print '.'
    else
      personable = Patient.create!(
        admitted_at: Faker::Date.between(11.years.ago, Date.today)
      )
      print '*'
    end

    Person.create!(
      email: Faker::Internet.email,
      name: Faker::Name.name,
      birth_date: Faker::Date.birthday(1, 120),
      account: account,
      personable: personable
    )
  }
  puts 'Finished creating people!'
end

def create_shifts(account, count)
  Shift.create!(


  )

end

def create_accout(count)
  account = Account.create!(name: Faker::Company.name)

  User.create!(
    email: Faker::Internet.email,
    name: Faker::Name.name,
    account: account,
    password: 'sample_user'
  )

  account
end

namespace :db do
  desc 'Drop, create, migrate, seed and populate sample data'
  task prepare: [:drop, :create, "schema:load", :seed, :populate_sample_data] do
    puts 'Ready to go!'
  end

  desc 'Populates the database with sample data'
  task populate_sample_data: :environment do

    account = create_account(1)

    create_people(account, 500)

    create_shifts(account, 100)
    
  end
end
