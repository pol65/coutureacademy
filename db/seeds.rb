# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.destroy_all
Lesson.destroy_all
Classroom.destroy_all

ActiveRecord::Base.connection.reset_pk_sequence!('users')
ActiveRecord::Base.connection.reset_pk_sequence!('lessons')
ActiveRecord::Base.connection.reset_pk_sequence!('classrooms')

n = 0
categories = ["Broderie", "Couture", "Modélisme", "Bonnes Pratiques"]

users = []
20.times do
    n = n+1
    users << User.create(
        email: "couture-academy#{n}@yopmail.com",
        password: "password",
        description: "Mon nom est #{Faker::Name.first_name} et je suis passionné.e de #{categories.sample}, et je me suis abonné.e à Couture Academy pour parfaire mes compétences.",
        username: Faker::Internet.username
    )
end

lessons = []
10.times do
    n = n+1
    lessons << Lesson.create(
        title: "#{n}. Les bases en Couture",
        content: "Voici le contenu du cours #{Faker::Lorem.paragraphs(number: 10)}",
        price: Faker::Number.between(from: 25, to: 150),
        category: categories.sample,
        teacher_id: users.sample.id
    )
end

classrooms = []
50.times do
    classrooms << Classroom.create(
        user_id: lessons.sample.teacher_id,
        lesson_id: lessons.sample.id
    )
end

puts "*** Database seed done ***"