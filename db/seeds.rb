# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

customer = User.create(name: 'customer', email: 'customer@example.com', password: '123456', password_confirmation: '123456', profile: :customer)
ninja = User.create(name: 'ninja', email: 'ninja@example.com', password: '123456', password_confirmation: '123456', profile: :ninja)

# new contract
Contract.create customer_id: customer.id, service_type: :espionage
# contract accepted
Contract.create customer_id: customer.id, ninja_id: ninja.id, date_accepted: Time.now, service_type: :murder
# contract finished
Contract.create customer: customer, ninja: ninja, date_accepted: Time.now, date_finished: Time.now, service_type: :sabotage
# contract finished with rating
Contract.create customer: customer, ninja: ninja, date_accepted: Time.now, date_finished: Time.now, service_type: :sabotage, rating: 8
