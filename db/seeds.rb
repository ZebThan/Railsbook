# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u = User.create(name: 'Testuser', email: 'test@example.pl', admin: true, about: 'reczny testowy', age: 15, password: 'adminadmin', password_confirmation: 'adminadmin')
50.times do
	u = User.create(name: Faker::Name.name, email: Faker::Internet.email, about:Faker::Lorem.sentence, age: Faker::Number.number(2), password: 'adminadmin', password_confirmation: 'adminadmin')
 	puts "User zrobiono"
end
