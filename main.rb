require "sinatra"
require "httparty"
# require 'sinatra/reloader' if development?

key = ENV["OMDB_KEY"]

get "/" do

    display_movies = 
    [
        {
            "Title" => "Inception",
            "Year" => "2010",
            "Poster" => "https://m.media-amazon.com/images/M/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@._V1_SX300.jpg",
            "Runtime" => "148 min",
            "Ratings" => 
            {
                "Source" => "Rotten Tomatoes",
                "Value" => "87%"
            }
        },
        {
            "Title" => "Parasite",
            "Year" => "2019",
            "Poster" => "https://m.media-amazon.com/images/M/MV5BYWZjMjk3ZTItODQ2ZC00NTY5LWE0ZDYtZTI3MjcwN2Q5NTVkXkEyXkFqcGdeQXVyODk4OTc3MTY@._V1_SX300.jpg",
            "Runtime" => "132 min",
            "Ratings" => 
            {
                "Source" => "Rotten Tomatoes",
                "Value" => "99%"
            }
        },
        {
            "Title" => "Black swan",
            "Year" => "2010",
            "Poster" => "https://m.media-amazon.com/images/M/MV5BNzY2NzI4OTE5MF5BMl5BanBnXkFtZTcwMjMyNDY4Mw@@._V1_SX300.jpg",
            "Runtime" => "108 min",
            "Ratings" => 
            {
                "Source" => "Rotten Tomatoes",
                "Value" => "85%"
            }
        },
        {
            "Title" => "The Matrix",
            "Year" => "1999",
            "Poster" => "https://m.media-amazon.com/images/M/MV5BNzQzOTk3OTAtNDQ0Zi00ZTVkLWI0MTEtMDllZjNkYzNjNTc4L2ltYWdlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SX300.jpg",
            "Runtime" => "136 min",
            "Ratings" => 
            {
                "Source" => "Rotten Tomatoes",
                "Value" => "88%"
            }
        },
        {
            "Title" => "Joker",
            "Year" => "2019",
            "Poster" => "https://m.media-amazon.com/images/M/MV5BNGVjNWI4ZGUtNzE0MS00YTJmLWE0ZDctN2ZiYTk2YmI3NTYyXkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_SX300.jpg",
            "Runtime" => "122 min",
            "Ratings" => 
            {
                "Source" => "Rotten Tomatoes",
                "Value" => "68%"
            }
        },
        {
            "Title" => "Knives out",
            "Year" => "2019",
            "Poster" => "https://m.media-amazon.com/images/M/MV5BMGUwZjliMTAtNzAxZi00MWNiLWE2NzgtZGUxMGQxZjhhNDRiXkEyXkFqcGdeQXVyNjU1NzU3MzE@._V1_SX300.jpg",
            "Runtime" => "130 min",
            "Ratings" => 
            {
                "Source" => "Rotten Tomatoes",
                "Value" => "97%"
            }
        }
    ]


    erb :index, locals: { display_movies: display_movies }

end

get "/movie" do

    title = params[:title]

    movie = HTTParty.get("http://omdbapi.com/?t=#{title}&apikey=#{key}")

    erb :movie, locals: { movie: movie }

end

get "/about" do

    erb :about

end


