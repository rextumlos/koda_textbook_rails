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

# Seed data for posts table
posts = [
  { title: "Post 1", content: "Content for Post 1", published: true },
  { title: "Post 2", content: "Content for Post 2", published: true },
  { title: "Post 3", content: "Content for Post 3", published: false },
]

Post.create(posts)
# posts.each do | post |
#   Post.create(post)
# end


# Seed data for categories table
categories = [
  { name: "Category 1" },
  { name: "Category 2" },
  { name: "Category 3" },
]

Category.create(categories)

# Seed data for post_category_ships table (associations between posts and categories)
post_category_ships = [
  { post_id: 1, category_id: 1 },
  { post_id: 1, category_id: 2 },
  { post_id: 2, category_id: 2 },
  { post_id: 3, category_id: 3 },
]

PostCategoryShip.create(post_category_ships)

# Seed data for comments table
comments = [
  { content: "Comment 1 for Post 1", post_id: 1 },
  { content: "Comment 2 for Post 1", post_id: 1 },
  { content: "Comment 1 for Post 2", post_id: 2 },
]

Comment.create(comments)

# Seed data for feedbacks table
feedbacks = [
  { email: "user1@example.com", message: "Feedback message 1" },
  { email: "user2@example.com", message: "Feedback message 2", remark: 1 },
  { email: "user3@example.com", message: "Feedback message 3" },
]

Feedback.create(feedbacks)

# Seed data for notes table (associations between notes and feedbacks)
notes = [
  { feedback_id: 1, content: "Note 1 for Feedback 1" },
  { feedback_id: 1, content: "Note 2 for Feedback 1" },
  { feedback_id: 2, content: "Note 1 for Feedback 2" },
]

Note.create(notes)