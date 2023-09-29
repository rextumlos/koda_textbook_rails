# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

20.times do
  initial_email = 5.times.map { (0...(rand(10))).map { ('a'..'z').to_a[rand(26)] }.join }.join("")
  message = 70.times.map { (0...(rand(10))).map { ('a'..'z').to_a[rand(26)] }.join }.join(" ")
  feedback = Feedback.create({email: "#{initial_email}@gmail.com" , message: "#{message}"})
end