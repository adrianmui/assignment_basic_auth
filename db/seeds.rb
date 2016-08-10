# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


  puts "Destroying all userszz"
  User.destroy_all
  puts "Creating new userzz"

  10.times do |i|
    User.create(
      username: Faker::Internet.user_name, 
      email: Faker::Internet.email, 
      password_digest: Faker::Internet.password(5))
  end

  puts "Finished creating userszz"