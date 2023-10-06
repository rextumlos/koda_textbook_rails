# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# 20.times do
#   initial_email = 5.times.map { (0...(rand(10))).map { ('a'..'z').to_a[rand(26)] }.join }.join("")
#   message = 70.times.map { (0...(rand(10))).map { ('a'..'z').to_a[rand(26)] }.join }.join(" ")
#   feedback = Feedback.create({email: "#{initial_email}@gmail.com" , message: "#{message}"})
# end

# Create user
3.times do |i|
  User.create(email: "user#{i}@gmail.com", name: Faker::Name.name, phone_number: Faker::PhoneNumber.phone_number, password: "password", password_confirmation: "password")
end

# Create categories
5.times do
  Category.find_or_create_by(name: Faker::Esport.game)
end

# Create remarks
Remark.create(name: 'Unmarked')
Remark.create(name: 'Bad')
Remark.create(name: 'Neutral')
Remark.create(name: 'Good')

# Create Posts
50.times do
  post = Post.create(
    title: Faker::Hipster.sentence(word_count: 1),
    content: Faker::Lorem.paragraph(sentence_count: 4, random_sentences_to_add: 4),
    category_ids: [Category.all.sample.id],
    user: User.all.sample
  )

  # Create comments in post
  10.times do
    Comment.create(
      content: Faker::Hacker.say_something_smart,
      post: post,
      user: User.all.sample
    )
  end
end

# Create Feedbacks
30.times do
  user = User.all.sample
  Feedback.create(
    user: user,
    email: user.email,
    message: Faker::GreekPhilosophers.quote,
    remark: Remark.first
  )
end



