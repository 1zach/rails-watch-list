require 'open-uri'
require 'rest-client'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "getting"
Movie.destroy_all
movie = RestClient.get "http://tmdb.lewagon.com/movie/top_rated?"
puts "parsing"
puts "this is Movie" 
movies_array = JSON.parse(movie)["results"]
puts "this is array" 


movies_array.each do |movie|
    puts "create"
    Movie.create(
        title: movie['title'],
        overview: movie['overview'],
        poster_url: movie['poster_path'],
        rating: movie['vote_average']
    )
    puts "created"
end