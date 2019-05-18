# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

account = Account.create!(name: 'Admin Account', active_at: Date.new(2019, 1, 1), active: true)

User.create!(
  name: 'Admin',
  email: ENV['super_admin_email'] || 'test@example.com',
  password: ENV['super_admin_pw'] || 'testtest',
  account: account
)
