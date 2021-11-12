require 'json'
require 'open-uri'

Movie.destroy_all

url = "http://tmdb.lewagon.com/movie/top_rated"
    movies = URI.open(url).read
    movie = JSON.parse(movies)
    puts movie['results'].each do |x|
      Movie.new({
         title: x['original_title'],
         overview: x['overview'],
         poster_url: "https://image.tmdb.org/t/p/w500#{x['poster_path']}",
         rating: x['vote_average']
      })
    end
