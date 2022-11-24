require 'movie_repository'

describe MovieRepository do
    def reset_movies_table
      seed_sql = File.read('spec/seeds.sql')
      connection = PG.connect({ host: '127.0.0.1', dbname: 'movies_test' })
      connection.exec(seed_sql)
    end
        
    before(:each) do 
      reset_movies_table
    end
    
    it "returns all movies in the database" do
        repo = MovieRepository.new
    
        movies = repo.all
    
        expect(movies.length).to eq(2)
        expect(movies.first.id).to eq('1')
        expect(movies.first.title).to eq('Lord of the Rings')
        expect(movies.first.genre).to eq('Fantasy')
        expect(movies.first.release_year).to eq('2001')
    end

    it "returns searches for and returns a specific entry based on the id" do 
        repo = MovieRepository.new

        movie = repo.find(1)
        
        expect(movie.title).to eq('Lord of the Rings')
    end

    it "inserts a new entry into the database" do 
        my_movie = Movie.new
        my_movie.title = "Back to the Future"
        my_movie.genre = "Sci-fi"
        my_movie.release_year = "1989"

        repo = MovieRepository.new
        repo.create(my_movie)
        all_movies = repo.all
        expect(all_movies.length).to eq 3 
    end

    it "deletes a record from the database by id" do
        repo = MovieRepository.new
        repo.delete(1)
        all_movies = repo.all
        expect(all_movies.length).to eq 1
    end
end
