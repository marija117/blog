# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create!([
  {
      full_name: "John Doe",
      email: "john@doe.com",
      password: "12345678",
      password_confirmation: "12345678"
  },
  {
      full_name: "Joe Smith",
      email: "joe@amith.com",
      password: "12345678",
      password_confirmation: "12345678"
  },
  {
      full_name: "Jane Doe",
      email: "jane@doe.com",
      password: "12345678",
      password_confirmation: "12345678"
  },
  {
      full_name: "Anna Smith",
      email: "anna@smith.com",
      password: "12345678",
      password_confirmation: "12345678"
  }
])

Post.create([
  {    
    user_id: User.first.id,
    title: "First Post",
    text: "asdfghjklqwe"
  },
  {    
    user_id: User.second.id,
    title: "Second Post",
    text: "asdfghjklqwe"
  },
  {
    user_id: User.first.id,
    title: "Third Post",
    text: "asdfghjklqwe"
  },
  { 
    user_id: User.find(3).id,
    title: "Forth Post",
    text: "asdfghjklqwe"
  },
  {
    user_id: User.find(3).id,
    title: "Fifth Post",
    text: "asdfghjklqwe"
  }
])

Comment.create([
  {
    user_id: User.first.id,
    post_id: Post.first.id,
    body: "First Comment"
  },
  {
    user_id: User.second.id,
    post_id: Post.first.id,
    body: "Second Comment"
  },
  {
    user_id: User.find(3).id,
    post_id: Post.first.id,
    body: "Third Comment"
  }
])

Reaction.create([
  {
    user_id: User.first.id,
    comment_id: Comment.first.id,
    category: "like"
  },
  {
    user_id: User.second.id,
    comment_id: Comment.first.id,
    category: "smile"
  },
  {
    user_id: User.find(3).id,
    comment_id: Comment.second.id,
    category: "smile"
  }
])