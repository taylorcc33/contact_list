# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
# t.string "first_name"
# t.integer "age"
# t.string "phone"
# t.string "email"
# t.string "last_name"
# t.boolean "friend"
10.times do
  contact = Contact.create(
    first_name: Faker::Name.name,
    age: rand(18...65),
    phone: Faker::PhoneNumber.cell_phone,
    email: Faker::Internet.email,
    last_name: Faker::Name.last_name,
    friend: rand(2).odd? ? true : false,
  )
  # Has many notes lets make number of notes random for each contact
  num_notes = rand(1..3)
  messages = [
    Faker::Hipster.sentences(number: 1),
    Faker::Quote.famous_last_words,
    Faker::ChuckNorris.fact,
  ]
  num_notes.times do |i|
    contact.notes.create(body: messages[i])
  end
end