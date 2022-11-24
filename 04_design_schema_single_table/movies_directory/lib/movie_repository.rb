require_relative 'movie'

class MovieRepository
    def all 
        sql = 'SELECT * FROM movies;'
        result_set = DatabaseConnection.exec_params(sql, [])

        movies = []

        result_set.each do |record|
            movie = Movie.new
            movie.id = record['id']
            movie.title = record['title']
            movie.genre = record['genre']
            movie.release_year = record['release_year']
      
            movies << movie
        end
        return movies
    end

    def find(id)
        sql = 'SELECT id, title, genre, release_year FROM movies WHERE id = $1;'
        sql_params = [id]

        result_set = DatabaseConnection.exec_params(sql, sql_params)
        record = result_set[0]

        movie = Movie.new
        movie.id = record['id']
        movie.title = record['title']
        movie.genre = record['genre']
        movie.release_year = record['releae_year']
        
        return movie
    end

    def create(movie)
        sql = 'INSERT INTO movies (title, genre, release_year) VALUES ($1, $2, $3);'
        params = [movie.title, movie.genre, movie.release_year]

        query = DatabaseConnection.exec_params(sql, params)
    end

    def delete(id)
        sql = 'DELETE FROM movies WHERE id = $1;'
        params = [id]

        query = DatabaseConnection.exec_params(sql, params)
    end

end