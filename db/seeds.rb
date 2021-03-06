# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

genres = []
10.times { |i| genres << FFaker::Book.genre }

100.times do |n|
  film = Film.create(title: FFaker::Movie.title, genre: genres.sample )
  10.times { |i| Review.create(comment: FFaker::Lorem.sentence, rate: rand(100), film_id: film.id) }
end
