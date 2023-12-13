# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
  if !User.find_by(name: "Admin").present?
    User.create(email:"admin@gmail.com", password: "admin@123", name: "Admin", role: "admin")
  end
 category1 = Category.find_or_create_by(name: "Bollywood")
 category2 = Category.find_or_create_by(name: "Hollywood")
 category3 = Category.find_or_create_by(name: "Tollywood")

 movies_data = [
  {
    name: "Avtar",
    rating: "4.5",
    description: "A great action movie",
    released_on: "1/05/2009",
    director: "Sam Worthington, Zoe Saldana",
    category_id: category1,
    image_path: "avtar.jpeg",
    user_id: 1
  },
  {
    name: "The Joker",
    rating: "4.5",
    description: "When a new detective is caught by a vicious psychopath and locked in a basement, he must use the knowledge he learned from some of the best detectives at Poker Night, then match wits against his captor.",
    released_on: "1/02/2015",
    director: "Beau Mirchoff, Halston Sage",
    category_id: category1,
    image_path: "joker.jpg",
    user_id: 1
  },
  {
    name: "Vikram",
    rating: "4.8",
    description: "A special investigator discovers a case of serial killings is not what it seems to be, and leading down this path is only going to end in a war between everyone involved.",
    released_on: "3/06/2022",
    director: "Kamal Haasan, Vijay Sethupathi",
    category_id: category3,
    image_path: "vikram.jpg",
    user_id: 1
  },
  {
    name: "Animal",
    rating: "5",
    description: "A father, who is often away due to work, is unable to comprehend the intensity of his son's love. Ironically, this fervent love and admiration for his father and family creates conflict between the father and son.",
    released_on: "3/11/2023",
    director: "Ranbir Kapoor, Anil Kapoor, Bobby Deol",
    category_id: category1,
    image_path: "animal.jpg",
    user_id: 1
  },
]


def create_movie(movie_data)
  movie = Movie.find_or_create_by(
    name: movie_data[:name],
    rating: movie_data[:rating],
    description: movie_data[:description],
    released_on: movie_data[:released_on],
    director: movie_data[:director],
    category_id: movie_data[:category_id].id,
    user_id: movie_data[:user_id]
  )
  
 movie.image.attach(io: File.open(Rails.root.join("app/assets/images", movie_data[:image_path])), filename: movie_data[:image_path])
end

movies_data.each do |movie_data|
  create_movie(movie_data)
end
