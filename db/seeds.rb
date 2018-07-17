# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# seed 50 records
50.times do
    todo = Todo.create(title: Faker::Lorem.word, created_by: User.first.id)
    todo.items.create(name: Faker::Lorem.word, done: false)
end