json.extract! movie, :id, :title, :year, :rank, :created_at, :updated_at
json.url movie_url(movie, format: :json)
