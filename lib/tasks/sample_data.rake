require 'faker'

namespace :db do
  desc 'Drop, create, migrate, seed and populate sample data'
  task prepare: [:drop, :create, "schema:load", :seed, :populate_sample_data] do
    puts 'Ready to go!'
  end

  desc 'Populates the database with sample data'
  task populate_sample_data: :environment do

    account = Account.create!(name: Faker::Company.name)
    User.create!(
      email: Faker::Internet.email,
      name: Faker::Name.name,
      account: account,
      password: 'sample_user'
    )

    puts 'Creating sample People'
    1000.times {
      if rand(1..10) > 1
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

    puts 'Finished!'
  end
end
