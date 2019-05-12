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

    patient = PersonType.find_by_name('Patient')
    binding.pry

    1000.times { 
      Person.create!(
        email: Faker::Internet.email,
        name: Faker::Name.name,
        birth_date: Faker::Date.birthday(1, 120),
        account: account,
        person_type: patient
      )
    }

  end
end
